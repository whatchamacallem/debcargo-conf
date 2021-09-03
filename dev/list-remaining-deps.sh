#!/bin/bash

abort() { local x=$1; shift; for i in "$@"; do echo >&2 "$0: abort: $i"; done; exit "$x"; }

echo >&2 "Note, this script is not very accurate and may print out redundant stuff,"
echo >&2 "e.g. dependencies of crates that we already patched away in Debian."

if [ -n "$DEBCARGO" ]; then
	true
elif type -p debcargo >/dev/null 2>&1; then
	DEBCARGO=$(type -p debcargo)
elif [ -f "$HOME/.cargo/bin/debcargo" ]; then
	DEBCARGO="$HOME/.cargo/bin/debcargo"
else
	abort 1 "debcargo not found, run \`cargo install debcargo\` or set DEBCARGO to point to it"
fi

if [ -d ../debcargo ]; then
	DEBCARGO_SRC=../debcargo
else
	abort 1 "debcargo.git not found, set DEBCARGO_SRC and try again"
fi

export DEBCARGO
for c in "$@"; do \
  "$DEBCARGO_SRC"/tests/sh/cargo-tree-deb-rec "$c"; done \
| sed -e 's/ v/ /g' \
| dev/filter-semver.sh \
| awk '!x[$0]++' \
| dev/filter-crate-in-debian.sh \
| sed -nre 's/(.*) 0$/\1/gp'
