#!/usr/bin/python3

import sys
import yaml

print("parsing excuses.yaml...", file=sys.stderr)
with open("excuses.yaml") as fp:
	y = yaml.load(fp)

excuses = {}
for e in y["sources"]:
	excuses[e["source"]] = e

rust_excuses = open(sys.argv[1], "w")
rust_excuses_arch = open(sys.argv[2], "w")

already_seen = set()

def print_all(*args, **kwargs):
	print(*args, **kwargs, file=rust_excuses)
	print(*args, **kwargs, file=rust_excuses_arch)

def traverse(name, arch="", d=0):
	if name in already_seen:
		return
	already_seen.add(name)
	for dep in excuses.get(name, {}).get("dependencies", {}).get("migrate-after", []):
		if "/" in dep:
			dep, arch = dep.split("/")
			print('"%s"' % name, "->", '"%s"' % dep, '[label="%s"]' % arch,
				file=rust_excuses_arch)
		else:
			print_all('"%s"' % name, "->", '"%s"' % dep)
		traverse(dep, arch, d+1)

print_all("digraph {")
for s in excuses.keys():
	if s.startswith("rust-"):
		traverse(s)
print_all("}")
