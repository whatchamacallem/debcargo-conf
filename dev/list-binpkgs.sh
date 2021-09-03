#!/bin/bash
# List all packages that produce rust binaries, from this repo.
grep -l "\[packages.bin\]" src/*/debian/debcargo.toml \
  | cut -d/ -f2 \
  | sed -e 's/^/rust-/g' \
  | tr '\n' ',' \
  | sed -e 's/,$/\n/'
