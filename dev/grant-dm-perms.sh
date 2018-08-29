#!/bin/sh
# Grant DM upload permissions on all crates maintained by a DM.
#
# TODO: use uploaders when that feature gets into debcargo
# https://salsa.debian.org/rust-team/debcargo/issues/10

m="$1"
shift
grep -l "$m" src/*/debian/copyright \
| sed -nre 's,src/(.*)/debian/copyright,\1,gp' \
| dev/filter-in-debian.sh \
| sed -nre 's/^(.*)\s1$/rust-\1/gp' \
| xargs -r dcut "$@" dm --uid "$m" --allow
