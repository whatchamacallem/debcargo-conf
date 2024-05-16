#!/bin/bash
# List all packages that produce rust binaries, from this repo.

# If the first command line argument is set to --uploaded, only show programs that have
# been uploaded
check_uploaded=${1:-disable}

grep -l "\[packages.bin\]" src/*/debian/debcargo.toml \
  | cut -d/ -f2 \
  | while read pkg; do
      # If check is enabled and 'uploaded' is found, or if check is disabled
      if [ "$check_uploaded" == "--uploaded" ] && grep -q "unstable" "src/$pkg/debian/changelog"; then
          echo "rust-$pkg"
      elif [ "$check_uploaded" == "disable" ]; then
          echo "rust-$pkg"
      fi
    done \
  | tr '\n' ',' \
  | sed -e 's/,$/\n/'
