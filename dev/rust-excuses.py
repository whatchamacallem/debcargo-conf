#!/usr/bin/python3

import re
import subprocess
import sys
import yaml

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
		n = subprocess.check_output("apt-cache showsrc %s 2>/dev/null | grep ^Package: | wc -l" % src, shell=True)
		is_in_debian_cache[src] = int(n.strip())
	x = is_in_debian_cache[src]
	print("in debian", src, x, file=sys.stderr)
	return x

def traverse(name, arch="", d=0):
	if name in already_seen:
		return
	already_seen.add(name)

	edges = set()
	for arch, deps in excuses.get(name, {}).get("dependencies", {}).get("unsatisfiable-dependencies", {}).items():
		for dep in deps:
			vers = ""
			if dep.startswith("librust-"):
				try:
					results = re.match(r"librust-(\S+?)(-[.0-9]+)?(\+\S*)?-dev", dep)
					dep = "rust-" + results.group(1)
					if results.group(2):
						vers = results.group(2)
				except:
					print(dep, file=sys.stderr)
					raise
			edges.add(edge_dep_label(name, dep, vers))
			print(edge_dep_label(name, dep, "%s/%s" % (vers, arch) if vers else arch), file=rust_excuses_arch)
			if dep not in already_seen:
				if is_in_debian(dep):
					print_all('"%s" [fillcolor="#ffcc66",style=filled]' % dep)
				else:
					print_all('"%s" [fillcolor="#ff6666",style=filled]' % dep)
	for edge in edges:
		print(edge, file=rust_excuses)

	for dep in excuses.get(name, {}).get("dependencies", {}).get("migrate-after", []):
		if "/" in dep:
			dep, arch = dep.split("/")
			print(edge_dep_label(name, dep, arch), file=rust_excuses_arch)
		else:
			print_all(edge_dep(name, dep))
		traverse(dep, arch, d+1)

print_all("digraph {")
for s in excuses.keys():
	if s.startswith("rust-"):
		traverse(s)
print_all("}")
