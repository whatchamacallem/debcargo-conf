#!/bin/bash
# Grant DM upload permissions on all crates maintained by a DM.

# this script needs dcut-ng
# and deb-src entries in /etc/apt/sources.list

if [ "$#" -ne 1 ]; then
    echo "Syntax: $0 <email>"
    exit 1
fi

m="$1"
shift
pkgs=$(grep -l "$m" src/*/debian/copyright src/*/debian/debcargo.toml \
| sed -nre 's,src/(.*)/debian/.*,\1,gp' \
| sort -u \
| dev/filter-package-in-debian.sh \
| sed -nre 's/^(.*)\s[1-9][0-9]*$/rust-\1/gp')

echo "Do you really want to grant DM upload permissions to $m for these packages:"
echo $pkgs
echo
echo "Press enter to grant DM upload permissions to $m for these packages, else press CTRL-C to abort."
read a
| xargs -t -r dcut "$@" dm --uid "$m" --allow
