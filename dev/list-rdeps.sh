#!/bin/bash
set -e
set -o pipefail

abort() { local x=$1; shift; for i in "$@"; do echo >&2 "$0: abort: $i"; done; exit "$x"; }

which grep-dctrl >/dev/null || abort 1 "grep-dctrl not found, install dctrl-tools"
which aptitude >/dev/null || abort 1 "aptitude not found, install it"

ARCHIVE="${ARCHIVE:-unstable}"

if [ $(($(date +%s) - $(stat -c %Y /var/cache/apt/pkgcache.bin))) -gt 7200 ]; then
	read -p "APT cache is a bit old, update? [Y/n] " x
	if [ "$x" != "n" ]; then sudo apt update; fi
fi

apt_versions() {
	aptitude versions --disable-columns -F '%p %t' --group-by=none "~rnative $1" | grep "$ARCHIVE"
}

installability() {
	if apt -t "$ARCHIVE" -s install "$1=$2" 2>/dev/null >/dev/null; then
		echo " "
	else
		echo "X"
	fi
}

list_rdeps() {
	pkg="${1//_/-}"
	pkg="${pkg#rust-}"

	echo "Versions of rust-${pkg} in $ARCHIVE:"
	apt_versions "~e^rust-${pkg}$" | sort | while read binpkg ver archive; do
		local stat="$(installability "$binpkg" "$ver")"
		printf "%s %-48s %-16s\n" "$stat" "$binpkg" "$ver"
	done
	echo

	echo "Versions of rdeps of rust-${pkg} in $ARCHIVE:"
	apt_versions "~D^librust-${pkg}~(\+~|-[0-9]~).*-dev$" | while read rdep ver archives; do
		apt-cache show "${rdep}=${ver}" \
		  | grep-dctrl -FDepends -e "librust-${pkg}(\+|-[0-9]).*-dev" -sPackage,Version,Depends - \
		  | cut -d: -f2 | cut '-d ' -f2- \
		  | sed -z -e 's/\n\n/\t/g' -e 's/\n/ /g' -e 's/\t/\n/g'
	done | sort | while read rdep ver deps; do
		local rustdeps="$(printf "%s" "$deps" | tr ',' '\n' | egrep -wo "librust-${pkg}(\+|-[0-9])\S*-dev" | tr '\n' ' ')"
		local stat="$(installability "$rdep" "$ver")"
		printf "%s %-48s %-16s depends on     %s\n" "$stat" "$rdep" "$ver" "$rustdeps"
	done
	echo
}

for i in "$@"; do list_rdeps "$i"; done

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
