#!/usr/bin/pypy3
# pypy3 runs faster than python3
#
# the excuses file can be found here:
# https://release.debian.org/britney/excuses.yaml

import re
import subprocess
import sys
import yaml

if len(sys.argv) != 4:
    print(
        """Generates dot files to show the migration deps
Usage: %s excuses.dot excuses_arch.dot regressions.list

Expects excuses.yaml in the current dir
    """
        % sys.argv[0]
    )
    sys.exit(0)

print("parsing excuses.yaml...", file=sys.stderr)
with open("excuses.yaml") as fp:
    y = yaml.load(fp, Loader=yaml.FullLoader)

excuses = {}
for e in y["sources"]:
    excuses[e["source"]] = e

print("generating dot files...", file=sys.stderr)
rust_excuses = open(sys.argv[1], "w")
rust_excuses_arch = open(sys.argv[2], "w")
rust_regressions = open(sys.argv[3], "w")

already_seen = set()

def edge_dep(name, dep):
    return " ".join(['"%s"' % name, "->", '"%s"' % dep])

def edge_dep_label(name, dep, label):
    return " ".join(['"%s"' % name, "->", '"%s"' % dep, '[label="%s"]' % label])

def print_all(*args, **kwargs):
    print(*args, **kwargs, file=rust_excuses)
    print(*args, **kwargs, file=rust_excuses_arch)

is_in_debian_cache = {}
def is_in_debian(src):
    global is_in_debian_cache
    if src not in is_in_debian_cache:
        n = subprocess.check_output(
            "apt-cache showsrc %s 2>/dev/null | grep ^Package: | wc -l" % src,
            shell=True,
        )
        is_in_debian_cache[src] = int(n.strip())
    x = is_in_debian_cache[src]
    return x


BG_NOT_IN_DEBIAN = "#cc0000"
BG_OLD_IN_DEBIAN = "#ffcc66"
BG_TOO_NEW = "#66ff99"
BG_MISC_WAIT = "#ffcc99"
BG_MISC_FAIL = "#ff6666"
BG_SOURCEONLY = "#9999ff"
VERDICT_FAIL = ("REJECTED_CANNOT_DETERMINE_IF_PERMANENT", "REJECTED_NEEDS_APPROVAL", "REJECTED_PERMANENTLY")

def traverse(name, arch="", d=0):
    if name in already_seen:
        return
    already_seen.add(name)
    dependencies = excuses.get(name, {}).get("dependencies", {})

    edges = set()
    for arch, deps in dependencies.get("unsatisfiable-dependencies", {}).items():
        for dep in deps:
            vers = ""
            if dep.startswith("librust-"):
                try:
                    results = re.match(r"librust-(\S+?)(-[.0-9]+)?(\+\S*)?-dev", dep)
                    dep = "rust-" + results.group(1)
                    if results.group(2):
                        vers = results.group(2)
                except Exception:
                    print(dep, file=sys.stderr)
                    raise
            edges.add(edge_dep_label(name, dep, vers))
            print(
                edge_dep_label(name, dep, "%s/%s" % (vers, arch) if vers else arch),
                file=rust_excuses_arch,
            )
            if dep not in already_seen:
                if is_in_debian(dep):
                    print_all('"%s" [fillcolor="%s",style=filled]' % (dep, BG_OLD_IN_DEBIAN))
                else:
                    print_all('"%s" [fillcolor="%s",style=filled]' % (dep, BG_NOT_IN_DEBIAN))
    for edge in edges:
        print(edge, file=rust_excuses)

    for dep in dependencies.get("migrate-after", []) + dependencies.get(
        "blocked-by", []
    ):
        if "/" in dep:
            dep, arch = dep.split("/")
            print(edge_dep_label(name, dep, arch), file=rust_excuses_arch)
        else:
            print_all(edge_dep(name, dep))
        traverse(dep, arch, d + 1)

    policy = excuses.get(name, {}).get("policy_info", {})
    failed = {k: v["verdict"] for (k, v) in policy.items() if v.get("verdict", "") != "PASS"}
    attrs = {"shape": "box"}
    if "age" in failed:
        del failed["age"]
        attrs.update({ "fillcolor": BG_TOO_NEW, "style": "filled" })
    if "autopkgtest" in failed:
        for k, v in policy["autopkgtest"].items():
            if k == "verdict": continue
            for uu in v.values():
                if "REGRESSION" in uu:
                    for u in uu:
                        if u and u.startswith("https://ci.debian.net/data/autopkgtest/testing"):
                            print(u, file=rust_regressions)
    if failed:
        if list(failed.keys()) == ["builtonbuildd"]:
            bg = BG_SOURCEONLY
            attrs.update({ "label": "\\N\\nneeds source-only upload" })
        elif any(v in VERDICT_FAIL for v in failed.values()):
            bg = BG_MISC_FAIL
            attrs.update({ "label": "\\N\\nfailed: %s" % ",".join(failed.keys()) })
        else:
            bg = BG_MISC_WAIT
            attrs.update({ "label": "\\N\\nwaiting: %s" % ",".join(failed.keys()) })
        attrs.update({ "fillcolor": bg, "style": "filled" })
    print_all('"%s" [%s]' % (name, ",".join("%s=\"%s\"" % p for p in attrs.items())))


# import code
# code.interact(local=locals())


print_all("digraph {")
for s in excuses.keys():
    if s.startswith("rust-"):
        traverse(s)
print_all("}")
