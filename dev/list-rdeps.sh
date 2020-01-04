#!/bin/bash
set -e
set -o pipefail

abort() { local x=$1; shift; for i in "$@"; do echo >&2 "$0: abort: $i"; done; exit "$x"; }

which grep-dctrl >/dev/null || abort 1 "grep-dctrl not found, install dctrl-tools"
which aptitude >/dev/null || abort 1 "aptitude not found, install it"

pkg="${1//_/-}"
pkg="${pkg#rust-}"

if [ $(($(date +%s) - $(stat -c %Y /var/cache/apt/pkgcache.bin))) -gt 7200 ]; then
	read -p "APT cache is a bit old, update? [Y/n] " x
	if [ "$x" != "n" ]; then sudo apt update; fi
fi

ARCHIVE="${ARCHIVE:-unstable}"
apt_versions() {
	aptitude versions --disable-columns -F '%p %t' --group-by=none "~rnative $1" | grep "$ARCHIVE"
}

echo "Version in $ARCHIVE:"
apt_versions "~e^rust-${pkg}$" || echo "(not in unstable)"
echo

echo "Versions of rdeps in $ARCHIVE:"
apt_versions "~D^librust-${pkg}(-dev|\+\w+-dev)$" | while read rdep ver archives; do
	apt-cache show "${rdep}=${ver}" \
	  | grep-dctrl -FDepends -e "librust-${pkg}(\+|-[0-9]).*-dev" -sPackage,Version,Depends - \
	  | sed -Ee "/Depends/s/.*(librust-${pkg}(\+|-[0-9])\S*-dev[^,]*).*/Depends: \1/g" \
	  | cut -d: -f2 | cut '-d ' -f2 \
	  | sed -z -e 's/\n\n/\t/g' -e 's/\n/ /g' -e 's/\t/\n/g'
done | sort | while read rdep ver dep; do
	printf "%-48s %-10s     depends on     %s\n" "$rdep" "$ver" "$dep"
done
echo

cat <<eof
You must upgrade any rdep that depends on an old version of ${pkg}, by patching
Cargo.toml to accept the new version of ${pkg} as a dependency. Of course,
check that the build works - if it doesn't, then you'll need to further patch
the source code of the rdep to use the API of the new version of ${pkg}.

Alternatively, if any rdep is obsolete (i.e. nothing else depends on it) then
you should file a RM request to remove it from the Debian archive:

$ reportbug ftp.debian.org
[..]
What sort of request is this?
[..]
 6 ROM       Package removal - Request Of Maintainer.
[..]
Choose the request type: 6
[..]
Is the removal to be done in a suite other than "unstable"? Don't select anything for "unstable"
[..]
Choose the suite: # input nothing here, i.e. "unstable"
Please enter the reason for removal: obsolete package, prevents others from migrating to testing
Is this removal request for specific architectures? [y|N|?]? n
[..]
# An editor will spawn, probably nano. add
#   X-Debbugs-Cc: pkg-rust-maintainers@alioth-lists.debian.net
# to the header, and then add the following text to the body:

Hi, please remove this package on all architectures. It is an old rust library
that is preventing newer ones from migrating to testing. Nothing else in the
archive depends on it these days.

# then save and exit, and proceed with submitting the report.
eof
