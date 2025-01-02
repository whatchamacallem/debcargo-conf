#!/bin/bash
# Grant DM upload permissions on all crates maintained by a DM.

# this script needs dcut-ng
# and deb-src entries in /etc/apt/sources.list

if [ "$1" = "--dry-run" ] ; then
	DRY_RUN=true
	shift
else
	DRY_RUN=false
fi

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

if [ -n "$pkgs" ] ; then
	if ! $DRY_RUN ; then
		echo "Do you really want to grant DM upload permissions to $m for these packages:"
		echo $pkgs
		echo
		echo "Press enter to grant DM upload permissions to $m for these packages, else press CTRL-C to abort."
		read a
		dcut "$@" dm --uid "$m" --allow $pkgs
	else
		echo "Run the following command (with dput-ng installed) to grant DM upload permissions to $m for their packages:"
		echo
		echo dcut "$@" dm --uid "$m" --allow $pkgs
	fi
else
	echo "No packages for $m found, either the email address is wrong or maybe you have no deb-src entries in sources.list?"
fi
