#!/bin/bash
# Filter list of crates by whether they're not in Debian.
# You need to have an up-to-date APT cache for Debian unstable.
set -e

while read crate ver; do
	pkg="${crate//_/-}"
	numpkg="$(apt-cache showsrc rust-"${pkg}${ver:+-$ver}" 2>/dev/null | grep ^Package: | wc -l)"
	echo "$crate $ver $numpkg"
done
