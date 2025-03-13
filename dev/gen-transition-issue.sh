#!/bin/bash

# This primitive script generates the description of Salsa issues tracking transitions.
# It uses codesearch (debian-codesearch-cli package) to look for the "librust-$CRATE"
# string in d/control and d/tests/control

print_usage() {
  echo "Usage: dev/gen-transition-issue.sh PACKAGE"
}

if [ $# -ne 1 ]; then
  print_usage >&2
  exit 1
elif [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  print_usage
  exit 0
fi

if ! command -v codesearch >/dev/null 2>&1; then
  echo "Error: this script requires codesearch. Please run 'apt-get install debian-codesearch-cli'" >&2
  exit 1
fi

PKG="$(echo "$1" | tr _ -)"

BDLIST="$(codesearch --print-filenames --per-package "librust-$PKG path:debian/control" 2>/dev/null | cut -d' ' -f2 | cut -d_ -f1)"
TDLIST="$(codesearch --print-filenames --per-package "librust-$PKG path:debian/tests/control" 2>/dev/null | cut -d' ' -f2 | cut -d_ -f1)"

if [ -z "$BDLIST" ] && [ -z "$TDLIST" ]; then
    echo "Found no build-dependencies nor test-dependencies" >&2
    exit 1
fi

LIST="$(printf "%s\n%s\n" "$BDLIST" "$TDLIST" | sort -u | sed 's|^|- [ ] |g')"

cat <<EOF >&2
WARNING: This is a very primitive script

Known issues:
 - It does not take suites into account
 - It only cares about libraries
 - Its author gave no thought to how it interacts with semver packages
----------
EOF

cat <<EOF
Packages:

$LIST

EOF
