#!/bin/sh

. ./vars.sh.frag

if ! shouldbuild "$BUILDDIR/debian/changelog" "$PKGDIR/debian/changelog" && \
   ! shouldbuild "$BUILDDIR/debian/changelog" "$DEBCARGO"; then
	exit 0
fi

REALVER="$(get_existing_version "$PKGDIR")"
run_debcargo --no-overlay-write-back --changelog-ready
