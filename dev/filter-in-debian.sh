#!/bin/bash
# Filter list of crates by whether they're not in Debian.
# You need to have an up-to-date APT cache for Debian unstable.
set -e

while read crate ver; do
	pkg="${crate//_/-}"
	fullpkg=rust-"${pkg}${ver:+-$ver}"
	numpkg="$(apt-cache showsrc "$fullpkg" 2>/dev/null | grep "^Package: $fullpkg" | wc -l)"
	echo "$crate $ver $numpkg"
done
