#!/bin/sh

. ./vars.sh.frag

if ! shouldbuild "$BUILDDIR/debian/changelog" "$PKGDIR/debian/changelog" && \
   ! shouldbuild "$BUILDDIR/debian/changelog" "$DEBCARGO"; then
	exit 0
fi

REALVER="$(sed -nre "s/.*Package .* (.*) from crates.io.*/\1/gp" "$PKGDIR/debian/changelog" | head -n1)"
run_debcargo --no-overlay-write-back
