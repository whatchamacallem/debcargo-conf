#!/bin/bash
# Package or update a new or existing crate.
#
# Usage: [REALVER=<EXACTVER>] ./release.sh <CRATE> [<SEMVER>]
#
# Envvars:
# See also ./vars.sh.frag for its envvars, which we pass through.


# Run this before sourcing vars.sh.frag so the user reads it first
exec_basename="$(basename "$0")"
case "$exec_basename" in
    new-package.sh|package.sh)
      echo >&2
      echo >&2 "WARNING! $exec_basename is deprecated. Please use update.sh instead."
      echo >&2
      # Add 1 second sleep so users read the deprecation notice,
      # get annoyed by the wait and start using update.sh
      sleep 1
      ;;
esac

. ./vars.sh.frag

case "$(git rev-parse --abbrev-ref HEAD)" in
pending-*)	abort 1 "You are on a pending-release branch, $0 can only be run on another branch, like master";;
esac

timeout 15 git fetch origin --prune || abort 1 "Failed to fetch upstream to check pending branches, please check network"
pending_branches=$(git branch --all --list "*pending-$PKGNAME")
if [ -n "$pending_branches" ]
then
	abort 1 "Please resolve these existing pending branches before updating this crate:$(printf "\n$pending_branches")"
fi

if [ -n "$VER" ]; then
	if [ ! -d "$PWD/src/$PKGBASE" ]; then
		abort 1 "Using crate $CRATE with version $VER but default-version is not packaged." \
		"Package that first by running this script without the explicit version."
	fi
fi
if [ ! -d "$PKGDIR/debian" ]; then
	mkdir -p "$PKGDIR/debian"
	cat <<-eof > "$PKGCFG"
	overlay = "."
	uploaders = ["$DEBFULLNAME <$DEBEMAIL>"]
	eof
fi
if [ ! -f "$PKGDIR/debian/copyright" ]; then
	cat <<-eof > "$PKGDIR/debian/copyright"
	FIXME fill me in using ./copyright.debcargo.hint as a guide
	eof
fi
if [ -n "$VER" -a "$(sed -ne 's/^semver_suffix\s*=\s*//p' "$PKGCFG")" != "true" ]; then
	if grep -q semver_suffix "$PKGCFG"; then
		sed -i -e 's/^\(semver_suffix\s*=\s*\).*/\1true/' "$PKGCFG"
	else
		sed -i -e '1isemver_suffix = true' "$PKGCFG"
	fi
fi

if ! grep -q uploaders "$PKGCFG"; then
	# try to auto-fill in uploaders if debcargo.toml doesn't have it
	uploader="$(grep -E -A1 "[0-9][0-9]*( Debian)? Rust Maintainers" "$PKGDIR/debian/copyright" | tail -n1 | sed -re 's/^\s*[0-9]+\s*//g')"
	uploader="${uploader:-$DEBFULLNAME <$DEBEMAIL>}"
	sed -i -e 's/^\(overlay.*\)$/\1\nuploaders = ["'"$uploader"'"]/' "$PKGCFG"
	echo >&2 "$0: Auto-added $uploader to uploaders in debcargo.toml, based on d/copyright"
	if [ "$uploader" != "$DEBFULLNAME <$DEBEMAIL>" ]; then
		read >&2 -p "$0: You may also want to add yourself; ctrl-c if you want to do that, or press enter to continue... " x
	fi
fi

run_debcargo

if ! git diff --quiet -- "$PKGDIR_REL"; then
	read -p "Update wrote some changes to $PKGDIR_REL, press enter to git diff..." x || true
	git diff -- "$PKGDIR_REL"
	echo >&2 "-- end of git diff --"
fi

cat >&2 <<eof
Automatic update of crate '$CRATE' finished, now manually review it.
Edit corresponding source files (in src/) to deal with FIXMEs mentioned above.
If a hint file (with .debcargo.hint suffix) is listed, edit the non-hint file
and git add both.
When done, re-run this command (./update.sh) for changes to take effect.
Review any diff and adapt hint file changes in their non-hint versions
accordingly.
On a major version bump, also check its reverse dependencies, and update them,
making sure nothing breaks.
eof
if [ -n $VER ]; then
	echo >&2 'This is a versioned package.'
	echo >&2 'You should have a good reason for this and document it in its debcargo.toml.'
fi
