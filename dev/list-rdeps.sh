#!/bin/bash
#
# Envvars:
# INST_CACHE
#     If running this script multiple times, set this to a path where we will
#     write data to be re-used next time. This makes the script slightly
#     quicker, but if the data is too old it will give inaccurate results.

set -e
shopt -s lastpipe # important for populating associative arrays via pipes

abort() { local x=$1; shift; for i in "$@"; do echo >&2 "$0: abort: $i"; done; exit "$x"; }

type grep-dctrl >/dev/null || abort 1 "grep-dctrl not found, install dctrl-tools"
type aptitude >/dev/null || abort 1 "aptitude not found, install it"
type gawk >/dev/null || abort 1 "gawk not found, install gawk"

ARCHIVE="${ARCHIVE:-unstable}"
ARCHIVT="${ARCHIVT:-testing}"

apt_versions() {
	aptitude versions --disable-columns -F '%e %p %t' --group-by=none "~rnative $1" || true
}

quick_apt_versions() {
	printf "%s\n" "$all_rust_packages" | gawk "\$1 ~ /$1/ && \$2 ~ /$2/ && \$3 ~ /$3/ && \$4 ~ /$4/ { ${5:-print} }"
}

# versions of source packages in unstable. used to ignore cruft (i.e. binary
# packages left over in unstable after an update, no longer built by a source)
declare -A srcver
src_version() {
	local src="$1"
	if [ -z "${srcver[$src]}" ]; then
		srcver["$src"]="$(quick_apt_versions "" "^librust-${src}-dev$" "" "\y$ARCHIVE\y" 'print $3')"
	fi
	echo "${srcver[$src]}"
}

tmpdir=$(mktemp -d)
# https://stackoverflow.com/a/14812383 inside "trap" avoids running handler twice
trap 'excode=$?; rm -rf "'"$tmpdir"'"; trap - EXIT' EXIT HUP INT QUIT PIPE TERM

if [ -n "$INST_CACHE" ]; then
	inst_cache="$INST_CACHE"
else
	inst_cache="$tmpdir/cache"
fi
touch "$inst_cache"

mkdir -p "$tmpdir/aptroot/etc/apt/apt.conf.d" "$tmpdir/aptroot/var/lib/apt/lists/" "$tmpdir/aptroot/etc/apt/preferences.d" "$tmpdir/aptroot/etc/apt/sources.list.d"
cat << END > "$tmpdir/aptroot/apt.conf"
Apt::Architecture "$(dpkg --print-architecture)";
Apt::Architectures "$(dpkg --print-architecture)";
Dir "$tmpdir/aptroot";
Acquire::Languages "none";
END
cat << END > "$tmpdir/aptroot/etc/apt/sources.list.d/debian.sources"
Types: deb deb-src
URIs: http://deb.debian.org/debian/
Suites: $ARCHIVE $ARCHIVT
Components: main
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
END
APT_CONFIG="$tmpdir/aptroot/apt.conf"
export APT_CONFIG
apt-get update

all_rust_packages="$(apt_versions "~e^rust-")"

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

list_rdeps() {
	pkg="${1//_/-}"
	pkg="${pkg#rust-}"
	declare -a binpkgs

	echo "Versions of rust-${pkg} in $ARCHIVE:"
	quick_apt_versions "^rust-${pkg}$" "" "" "\y$ARCHIVE\y" | sort | while read srcpkg binpkg ver archive; do
		if [ "$ver" != "$(src_version "$pkg")" ]; then continue; fi
		local stat="$(installability "$binpkg" "$ver")"
		printf "%s %-48s %-16s\n" "$stat" "$binpkg" "$ver"
		binpkgs+=("$binpkg=$ver")
	done
	echo

	echo "Versions of rdeps of rust-${pkg} in $ARCHIVE, that also exist in $ARCHIVT:"
	local rdeps="$(apt_versions "~D^librust-${pkg}~(\+~|-[0-9]~).*-dev$")"
	printf "%s\n" "$rdeps" | grep "$ARCHIVE" | while read src rdep ver archive; do
		# we're interested in packages in both archives.
		if ! printf "%s\n" "$rdeps" | grep "$ARCHIVT" | grep -qF "$rdep"; then
			local rdepv="$(echo "$rdep" | sed -E -e 's/-[0-9.]+-dev$/-dev/')"
			# we're also interested in old-semver packages where the main version is in testing,
			# since this implies that we're interested in trying to migrate the old-semver package
			if ! printf "%s\n" "$rdeps" | grep "$ARCHIVT" | grep -qF "$rdepv"; then
				# if a rdep matches none of these, we're not interested (at this time) in migrating them;
				# they will show up on `dev/rust-excuses.mk` later in a more obvious way
				continue
			fi
		fi
		apt-cache show "${rdep}=${ver}" \
		  | grep-dctrl -FDepends -e "librust-${pkg}(\+|-[0-9]).*-dev" -sPackage,Version,Depends - \
		  | cut -d: -f2 | cut '-d ' -f2- \
		  | sed -z -e 's/\n\n/\t/g' -e 's/\n/ /g' -e 's/\t/\n/g'
	done | sort | while read rdep ver deps; do
		local src="$(apt-cache show "$rdep=$ver" | grep-dctrl -n -sSource - | sed -Ee 's/^rust-(\S*).*/\1/g')"
		if [ -n "$src" ] && [ -z "${seen[$src]}" ]; then
			seen["$src"]="1"
			queue+=("$src") # subprocess, var doesn't write to parent
		fi
		if [ "$ver" != "$(src_version "$src")" ]; then continue; fi
		local rustdeps="$(printf "%s" "$deps" | tr ',' '\n' | grep -E -wo "librust-${pkg}(\+|-[0-9])\S*-dev[^,]*" | tr '\n' '\t' | sed -e 's/\t/, /g')"
		local stat="$(installability "$rdep" "$ver")"
		printf "%s %-48s %-16s depends on     %s\n" "$stat" "$rdep" "$ver" "$rustdeps"
	done
	echo

	echo "Source packages in unstable whose autopkgtests are triggered by rust-$pkg:"
	while [ -n "${binpkgs[0]}" ]; do
		local binver="${binpkgs[0]}"
		binpkgs=("${binpkgs[@]:1}")

		local binpkg="${binver/=*/}"
		binpkg="$(apt-cache show "$binver" | grep-dctrl -F Package -ns Package -s Provides -e "${binpkg//\+/\\+}" | tr '\n' '|' | sed -e 's/ \+\(([^)]*)\)\?,\? */|/g' -e 's/+/\\+/g' -e 's/|\+$//g' -e 's/|{2,}/|/g')"
		# check for bin package + all its provided virtual feature packages in one go
		grep-dctrl -F Testsuite-Triggers -s Package,Version -w "$binpkg" "$tmpdir"/aptroot/var/lib/apt/lists/*_dists_"$ARCHIVE"_*_source_Sources* \
		  | cut -d: -f2 | cut '-d ' -f2- \
		  | sed -z -e 's/\n\n/\t/g' -e 's/\n/ /g' -e 's/\t/\n/g' \
		  | while read triggered ver; do
		    printf "  %-48s %-16s triggered by     %s\n" "$triggered" "$ver" "$binver"
		done
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
