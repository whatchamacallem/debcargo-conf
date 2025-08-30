#!/bin/sh
set -eu
CRATE="$1"
touch "src/$CRATE/debian/RFS"
git add "src/$CRATE/debian/RFS"
git commit -vm "$CRATE: create RFS file"
