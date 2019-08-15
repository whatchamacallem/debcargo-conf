#!/usr/bin/python3
# the excuses file can be found here:
# https://release.debian.org/britney/excuses.yaml

import re
import subprocess
import sys
import yaml

if len(sys.argv) != 3:
    print(
        """Generates dot files to show the migration deps
Usage: %s excuses.dot excuses_arch.dot

Expects excuses.yaml in the current dir
    """
        % sys.argv[0]
    )
    sys.exit(0)

print("parsing excuses.yaml...", file=sys.stderr)
with open("excuses.yaml") as fp:
    y = yaml.load(fp)

excuses = {}
for e in y["sources"]:
    excuses[e["source"]] = e

print("generating dot files...", file=sys.stderr)
rust_excuses = open(sys.argv[1], "w")
rust_excuses_arch = open(sys.argv[2], "w")

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
                    print_all('"%s" [fillcolor="#ffcc66",style=filled]' % dep)
                else:
                    print_all('"%s" [fillcolor="#ff6666",style=filled]' % dep)
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

    if not dependencies:
        age = excuses.get(name, {}).get("policy_info", {}).get("age", {})
        if age.get("verdict", "") == "REJECTED_TEMPORARILY":
            print_all('"%s" [fillcolor="#66ff99",style=filled]' % name)


# import code
# code.interact(local=locals())


print_all("digraph {")
for s in excuses.keys():
    if s.startswith("rust-"):
        traverse(s)
print_all("}")
