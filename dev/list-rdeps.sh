#!/bin/bash

set -e

abort() { local x=$1; shift; for i in "$@"; do echo >&2 "$0: abort: $i"; done; exit "$x"; }

which grep-dctrl >/dev/null || abort 1 "grep-dctrl not found, install dctrl-tools"
which aptitude >/dev/null || abort 1 "aptitude not found, install it"

ARCHIVE="${ARCHIVE:-unstable}"
ARCHIVT="${ARCHIVT:-testing}"

if ! grep "$ARCHIVE" -qR /etc/apt/sources.list /etc/apt/sources.list.d/ || \
   ! grep "$ARCHIVT" -qR /etc/apt/sources.list /etc/apt/sources.list.d/; then
	cat <<-eof
To make this script work, you will need Debian Testing *AND* Debian Unstable
in your sources.list. If you want your system to prefer Debian Testing, be
sure to also add these lines to your /etc/apt/apt.conf:

APT::Default-Release "$ARCHIVT";

After these changes, make sure to re-run \`apt-get update\`.
eof
	exit 1
fi

if [ $(($(date +%s) - $(stat -c %Y /var/cache/apt/pkgcache.bin))) -gt 7200 ]; then
	read -p "APT cache is a bit old, update? [Y/n] " x
	if [ "$x" != "n" ]; then sudo apt update; fi
fi

apt_versions() {
	aptitude versions --disable-columns -F '%p %t' --group-by=none "~rnative $1" || true
}

if [ -n "$INST_CACHE" ]; then
	inst_cache="$INST_CACHE"
else
	inst_cache=$(mktemp)
	# https://stackoverflow.com/a/14812383 inside "trap" avoids running handler twice
	trap 'excode=$?; rm -rf "'"$inst_cache"'"; trap - EXIT' EXIT HUP INT QUIT PIPE TERM
fi

installability() {
	local r=$(grep -F "$1=$2" "$inst_cache" | cut -f2)
	if [ -n "$r" ]; then
		echo "$r"
	else
		if apt -t "$ARCHIVE" -s install "$1=$2" 2>/dev/null >/dev/null; then
			r=" "
		else
			r="X"
		fi
		printf "%s=%s\t%s\n" "$1" "$2" "$r" >> "$inst_cache"
		echo "$r"
	fi
}

# variables for BFS over rdeps
declare -A seen
declare -a queue
shopt -s lastpipe

list_rdeps() {
	pkg="${1//_/-}"
	pkg="${pkg#rust-}"

	echo "Versions of rust-${pkg} in $ARCHIVE:"
	apt_versions "~e^rust-${pkg}$" | grep "$ARCHIVE" | sort | while read binpkg ver archive; do
		local stat="$(installability "$binpkg" "$ver")"
		printf "%s %-48s %-16s\n" "$stat" "$binpkg" "$ver"
	done
	echo

	echo "Versions of rdeps of rust-${pkg} in $ARCHIVE, that also exist in $ARCHIVT:"
	local versions="$(apt_versions "~D^librust-${pkg}~(\+~|-[0-9]~).*-dev$")"
	printf "%s\n" "$versions" | grep "$ARCHIVE" | while read rdep ver archive; do
		if ! printf "%s\n" "$versions" | grep "$ARCHIVT" | grep -qF "$rdep"; then
			# we're only interested in packages in both archives.
			# if a pkg-ver is not in either archive, this doesn't affect the migration process
			continue
		fi
		apt-cache show "${rdep}=${ver}" \
		  | grep-dctrl -FDepends -e "librust-${pkg}(\+|-[0-9]).*-dev" -sPackage,Version,Depends - \
		  | cut -d: -f2 | cut '-d ' -f2- \
		  | sed -z -e 's/\n\n/\t/g' -e 's/\n/ /g' -e 's/\t/\n/g'
	done | sort | while read rdep ver deps; do
		local rustdeps="$(printf "%s" "$deps" | tr ',' '\n' | egrep -wo "librust-${pkg}(\+|-[0-9])\S*-dev[^,]*" | tr '\n' '\t' | sed -e 's/\t/, /g')"
		local stat="$(installability "$rdep" "$ver")"
		printf "%s %-48s %-16s depends on     %s\n" "$stat" "$rdep" "$ver" "$rustdeps"
		local src="$(apt-cache show "$rdep=$ver" | grep-dctrl -n -sSource - | sed -Ee 's/^rust-(\S*).*/\1/g')"
		if [ -n "$src" ] && [ -z "${seen[$src]}" ]; then
			seen["$src"]="1"
			queue+=("$src") # subprocess, var doesn't write to parent
		fi
	done
	echo
}

if [ "$1" = "@" ]; then
	shift
	queue+=("$@")
	while [ -n "${queue[0]}" ]; do
		echo "queue: ${queue[@]}"
		src="${queue[0]}"
		seen["$src"]="1"
		queue=("${queue[@]:1}")
		list_rdeps "$src"
	done
else
	for i in "$@"; do list_rdeps "$i"; done
fi

cat <<eof
If any package is marked "X" (to the left of the package) it means it is not
installable even in $ARCHIVE - you should check why this is so by attempting to
install it yourself, e.g. via aptitude, and see why it can't be installed. This
must be fixed before migration is attempted. For example, it may depend on a
package which is not yet in Debian. Make sure you give the \`-t $ARCHIVE\` flag
so it chooses packages from the correct archive.

One common reason, for an rdep, is that its dependency is out of date - check
the "depends" column above to see if this is the case. If so, you must upgrade
it to the current version, by patching Cargo.toml to accept the new version of
the dependency. Of course, check that the build works - if it doesn't, then
you'll need to further patch the source code of the rdep to use the API of the
new version of the dependency.

Alternatively, if any rdep is obsolete (i.e. nothing else depends on it) then
you should file a RM request to remove it from the Debian archive. See the
section "Remove an obsolete package" in RELEASE.rst for instructions on that.
eof
