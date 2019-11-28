#!/bin/bash
# Filter list of packages by whether they're in Debian.
# You need to have an up-to-date APT cache for Debian unstable.
set -e

while read pkg ver; do
	pkg="${pkg//_/-}"
	numpkg="$(apt-cache showsrc rust-$pkg 2>/dev/null | grep "^Version: ${ver:+${ver}$}" | wc -l)"
	echo "$pkg $ver $numpkg"
done
