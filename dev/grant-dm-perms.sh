#!/bin/sh
# Grant DM upload permissions on all crates maintained by a DM.

m="$1"
shift
grep -l "$m" src/*/debian/copyright src/*/debian/debcargo.toml \
| sed -nre 's,src/(.*)/debian/.*,\1,gp' \
| sort -u \
| dev/filter-in-debian.sh \
| sed -nre 's/^(.*)\s1$/rust-\1/gp' \
| xargs -r dcut "$@" dm --uid "$m" --allow
