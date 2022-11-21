#!/usr/bin/python3
# the excuses file can be found here:
# https://release.debian.org/britney/excuses.yaml

import sys
import yaml

print("parsing excuses.yaml...", file=sys.stderr)
with open("excuses.yaml") as fp:
    y = yaml.load(fp, Loader=yaml.Loader)

excuses = {}
for e in y["sources"]:
    package = e.get("source")
    if not package.startswith("rust-"):
        # We only care about rust packages
        continue
    for e2 in e.get("excuses"):
        if "Not built on buildd" in e2:
            print("%s needs a source-only upload" % package)
