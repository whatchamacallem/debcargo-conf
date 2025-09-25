#!/bin/bash
# Build a packaged crate.
#
# This script is not run directly, but linked into ./build/ when running one of
# the other scripts, so you should do that instead of running this directly.
#
# Usage: [REALVER=<EXACTVER>] ./build.sh <CRATE> [<SEMVER>] [<EXTRA DEPENDENCY DEB> ...]
#
# Envvars:
# IGNORE_MISSING_BUILD_DEPS=1
#     Don't abort on missing build deps. You'll need
#     this when giving extra dependency debs.
# SKIP_SIGN=1
#     Skip signing built packages.
# DISTRO=$suite
#     Release to something other than unstable, e.g. experimental
# CHROOT=$chroot
#     Build using another schroot than debcargo-unstable-amd64-sbuild
# SBUILD_OPTS=
#     will pass to sbuild; for example SBUILD_OPTS=--arch=i386
# EXTRA_DEBS
#     Include extra dependency debs, e.g. EXTRA_DEBS=librust*.deb.
# CHROOT_MODE=unshare
#     Whether to build with sbuild unshare mode
set -e

SCRIPTDIR="$(dirname "$(readlink -f "$0")")"

abort() { local x=$1; shift; for i in "$@"; do echo >&2 "$0: abort: $i"; done; exit "$x"; }
report() { for i in "$@"; do echo >&2 "debcargo-conf builder: $i"; done; }

if [ "$(basename "$PWD")" != "build" ]; then
	abort 1 "This script is only meant to be run from the build/ directory."
fi

if [ -n "$DEBCARGO" ]; then
	true
elif type -p debcargo >/dev/null 2>&1; then
	DEBCARGO=$(type -p debcargo)
elif [ -f "$HOME/.cargo/bin/debcargo" ]; then
	DEBCARGO="$HOME/.cargo/bin/debcargo"
else
	abort 1 "debcargo not found, run \`cargo install debcargo\` or set DEBCARGO to point to it"
fi

CRATE="$1"
VER="$2"
if test -z "$VER" -o -f "$VER"; then
	VER=""
	shift
else
	shift 2
fi
DISTRO="${DISTRO:-unstable}"

PKGNAME=$($DEBCARGO deb-src-name "$CRATE" $VER || abort 1 "couldn't find crate $CRATE")
DEBVER=$(dpkg-parsechangelog -l $PKGNAME/debian/changelog -SVersion)
DEBSRC=$(dpkg-parsechangelog -l $PKGNAME/debian/changelog -SSource)
DEBDIST=$(dpkg-parsechangelog -l $PKGNAME/debian/changelog -SDistribution)
DEB_HOST_ARCH=$(dpkg-architecture -q DEB_HOST_ARCH)
SRCNAME="${DEBSRC}_${DEBVER}"
BUILDNAME="${DEBSRC}_${DEBVER}_${DEB_HOST_ARCH}"

if [ -z "$CHROOT" ]; then
	if [ "$CHROOT_MODE" = "unshare" ]; then
		# nothing to do here, mmdebstrap will create a new chroot tarball on demand
		CHROOT="debcargo-unstable-${DEB_HOST_ARCH}-sbuild"
	elif schroot -i -c "debcargo-unstable-${DEB_HOST_ARCH}-sbuild" >/dev/null 2>&1; then
		CHROOT="debcargo-unstable-${DEB_HOST_ARCH}-sbuild"
	elif schroot -i -c "unstable-${DEB_HOST_ARCH}-sbuild" >/dev/null 2>&1; then
		CHROOT="unstable-${DEB_HOST_ARCH}-sbuild"
		echo >&2 "Automatically using sbuild chroot unstable-${DEB_HOST_ARCH}-sbuild; however it's"
		echo >&2 "strongly recommended to create a separate chroot debcargo-unstable-${DEB_HOST_ARCH}-sbuild"
		echo >&2 "so your builds won't have to re-download & re-install cargo, rustc, and llvm every time."
		echo >&2 "See the section \"Setting up\" of the Debian Rust Team Book for details:"
		echo >&2 "https://rust-team.pages.debian.net/book/process-single.html#setting-up"
		sleep 1
	elif [ "$SOURCEONLY" != 1 ]; then
		abort 1 "could not automatically find a suitable chroot; set CHROOT"
	fi
fi

shouldbuild() {
	local dst="$1"
	local src="$2"
	test ! -e "$dst" -o "$src" -nt "$dst"
}

# maintain an apt cache in ./build/aptroot
mkdir -p "./aptroot/etc/apt/apt.conf.d" "./aptroot/var/lib/apt/lists/" "./aptroot/etc/apt/preferences.d"
cat << END > "./aptroot/apt.conf"
Apt::Architecture "$DEB_HOST_ARCH";
Apt::Architectures "$DEB_HOST_ARCH";
Dir "$PWD/aptroot";
Acquire::Languages "none";
END
{
echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://deb.debian.org/debian/ $DISTRO main";
echo "deb-src [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://deb.debian.org/debian/ $DISTRO main";
case $DISTRO in
	experimental|rc-buggy)
		echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://deb.debian.org/debian/ unstable main"
		;;
	unstable|sid|testing) : ;;
	*-backports)
		echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://deb.debian.org/debian/ ${DISTRO%-backports} main";
		echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://deb.debian.org/debian/ ${DISTRO%-backports}-updates main";
		echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://security.debian.org/debian-security/ ${DISTRO%-backports}-security main";
		;;
	*)
		# assume stable release
		echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://deb.debian.org/debian/ $DISTRO-updates main";
		echo "deb [signed-by=/usr/share/keyrings/debian-archive-keyring.gpg] http://security.debian.org/debian-security/ $DISTRO-security main";
		;;
esac;
} > "./aptroot/etc/apt/sources.list"
APT_CONFIG="$PWD/aptroot/apt.conf"
export APT_CONFIG
apt-get update

if shouldbuild "$SRCNAME.dsc" "$PKGNAME/debian/changelog" ]; then
	if [ "$REUSE_EXISTING_ORIG_TARBALL" = 1 ]; then
		UPSVER="${DEBVER%-*}"
		mv "${DEBSRC}_${UPSVER}.orig.tar.gz" "${DEBSRC}_${UPSVER}.orig.tar.gz.new"
		apt-get -t unstable source --download-only "${DEBSRC}" # "=${DEBVER}"
		# check that old tarball contains same contents as new tarball
		if ! diff -ru \
			  --label "${DEBSRC}_${UPSVER}.orig.tar.gz.new" \
			  <(zcat  "${DEBSRC}_${UPSVER}.orig.tar.gz.new" | tar -tvvf-) \
			  --label "${DEBSRC}_${UPSVER}.orig.tar.gz" \
			  <(zcat  "${DEBSRC}_${UPSVER}.orig.tar.gz" | tar -tvvf-); then
			read -p "contents differ, continue with old tarball or abort? [y/N] " x
			if [ "$x" != "y" ]; then exit 1; fi
		fi
		# extract old tarball into new directory, to avoid "modified files" problems with dpkg-source later
		( cd "$PKGNAME" && dpkg-source --after-build . && tar --strip-components=1 -xf "../${DEBSRC}_${UPSVER}.orig.tar.gz" )
	fi
	( cd "$PKGNAME" && dpkg-buildpackage -d -S --no-sign )
	# sign if not UNRELEASED
	if echo "$DEBDIST" | grep -qv UNRELEASED-FIXME-AUTOGENERATED-DEBCARGO; then
		if [ "$SKIP_SIGN" != 1 ]; then
			debsign ${DEBSIGN_KEYID:+-k $DEBSIGN_KEYID} "${SRCNAME}_source.changes"
		fi
	fi
fi

# allow tab, comma, space as separators
IFS='	, ' read -r -a EXTRA_DEBS <<< "$EXTRA_DEBS"
if [ ${#EXTRA_DEBS[@]} -eq 0 ]; then
	EXTRA_DEBS=( "$@" )
fi
if [ ${#EXTRA_DEBS[@]} -ne 0 ]; then
	IGNORE_MISSING_BUILD_DEPS=1
	echo >&2 "Given non-empty extra debs; defaulting IGNORE_MISSING_BUILD_DEPS=1"
fi

check_build_deps() {
	mkdir -p dpkg-dummy
	# Dir::State::Lists is /var/lib/apt/lists by default.
	# Since apt replaces the files in that directory instead of rewriting
	# existing inodes, we can rely on the directory mtime.
	if shouldbuild dpkg-dummy/status "$(eval "$(apt-config shell v Dir::State::Lists/d)"; printf "$v")"; then
		# pretend dpkg status file that marks all packages as installed
		# this is because dpkg-checkbuilddeps only works on installed pkgs
		( apt-cache dumpavail -o APT::Default-Release=$DISTRO && \
			for i in ${EXTRA_DEBS[*]}; do apt-cache show $(echo $i | cut -d_ -f1); done ) | \
		sed -e 's/Package: .*/\0\nStatus: install ok installed/g' > dpkg-dummy/status.tmp
		if ! test -s dpkg-dummy/status.tmp; then
			abort 1 "couldn't generate dpkg-dummy/status, is Debian unstable in your APT sources?"
		fi
		mv dpkg-dummy/status{.tmp,}
	fi
	( cd "$PKGNAME" && dpkg-checkbuilddeps --admindir=../dpkg-dummy )
}

if ! check_build_deps; then
	if [ "$IGNORE_MISSING_BUILD_DEPS" != 1 ]; then
		abort 1 'Missing build dependencies, possibly due to one of these reasons:' \
			'- Version mismatch, which could be worked around ("relaxed") by patching Cargo.toml' \
			'- Disabled feature, which requires either enabling in the dependency or disabling locally'
	fi
fi

unset APT_CONFIG

if [ "$SOURCEONLY" = 1 ]; then
	exit
fi

if [ -n "${EXTRA_DEBS[*]}" ]; then
    EXTRA_DEBS_SBUILD=("${EXTRA_DEBS[@]/#/--extra-package=}")
    EXTRA_DEBS_REPO_TMP=$(mktemp -d "${SRCNAME}_REPO_XXXXXXXX")
    # trap cleans up even if user does Ctrl-C
    # https://stackoverflow.com/a/14812383 inside "trap" avoids running handler twice
    trap 'excode=$?; rm -rf "'"$EXTRA_DEBS_REPO_TMP"'"; trap - EXIT' EXIT HUP INT QUIT PIPE TERM
    # symlinks don't work here
    ln -f "${EXTRA_DEBS[@]}" "$EXTRA_DEBS_REPO_TMP/"
    ( cd "$EXTRA_DEBS_REPO_TMP"; apt-ftparchive packages . > Packages )
    EXTRA_DEBS_AUTOPKGTEST_OPTS=([0]=--autopkgtest-opt=--copy="$PWD/$EXTRA_DEBS_REPO_TMP/:/tmp/$EXTRA_DEBS_REPO_TMP/" [1]=--autopkgtest-opt=--add-apt-source="deb [trusted=yes] file:///tmp/$EXTRA_DEBS_REPO_TMP ./")
fi

if [ "$CHROOT_MODE" = "unshare" ]; then
	CACHE_DIR=${XDG_CACHE_HOME:-${HOME}/.cache}
	CHROOT_TARBALL=$(find "${CACHE_DIR}/sbuild/" -name "${CHROOT}.t*" -print -quit)
	AUTOPKGTEST_OPTS=("--run-autopkgtest" "--autopkgtest-root-arg=" "--autopkgtest-opts=--apt-upgrade -- unshare -t ${CHROOT_TARBALL} ${DISTRO:+-r $DISTRO}")
else
	AUTOPKGTEST_OPTS=("--run-autopkgtest" "--autopkgtest-root-arg=" "--autopkgtest-opts=-- schroot ${CHROOT}")
fi


if [ "$SKIP_AUTOPKGTEST" = 1 ]; then
	AUTOPKGTEST_OPTS=()
	EXTRA_DEBS_AUTOPKGTEST_OPTS=()
fi

LINTIAN_OPTS=()
if echo "$DEBDIST" | grep -q UNRELEASED-FIXME-AUTOGENERATED-DEBCARGO; then
	LINTIAN_OPTS=([0]="--lintian-opt=--suppress-tags" [1]="--lintian-opt=bad-distribution-in-changes-file")
fi

SBUILD_CONFIG="$SCRIPTDIR/dev/sbuildrc" sbuild --no-source --arch-any --arch-all \
  ${CHROOT:+-c $CHROOT} \
  ${CHROOT_MODE:+--chroot-mode "$CHROOT_MODE"} \
  ${DISTRO:+-d $DISTRO} \
  "${EXTRA_DEBS_SBUILD[@]}" \
  "${EXTRA_DEBS_AUTOPKGTEST_OPTS[@]}" \
  "${AUTOPKGTEST_OPTS[@]}" \
  "${LINTIAN_OPTS[@]}" \
   ${SBUILD_OPTS} \
  "$SRCNAME.dsc"
if [ "$SKIP_AUTOPKGTEST" != 1 ]; then
	report "analyzing autopkgtest log: $BUILDNAME.test.log"
	# this is a bit of a hack but works OK for now, until sbuild supports %SBUILD_BUILD_DIR in --autopkgtest-opt
	sed -ne '/autopkgtest .*: testing package .* version .*/,$p' "$BUILDNAME.build" > "$BUILDNAME.test.log"
	"$SCRIPTDIR/dev/rust-regressions.sh" "$BUILDNAME.test.log"
fi

changestool "$BUILDNAME.changes" adddsc "$SRCNAME.dsc"
report "build complete: $BUILDNAME.changes"

if grep -q "unknown-section FIXME" "$BUILDNAME.build"; then
    abort 1 "Please fix the SECTION, found FIXME"
fi

# sign if not UNRELEASED
if echo "$DEBDIST" | grep -qv UNRELEASED-FIXME-AUTOGENERATED-DEBCARGO; then
	if [ "$SKIP_SIGN" != 1 ]; then
		debsign ${DEBSIGN_KEYID:+-k $DEBSIGN_KEYID} --no-re-sign "$BUILDNAME.changes"
	fi
fi
