#!/bin/bash
# Filter package-versions of our rust packages, that are not in NEW.

comm -13 \
  <(curl -s https://ftp-master.debian.org/new.html \
    | sed -nre 's,.*<a href="new/rust-([a-zA-Z0-9-]*)_([.a-zA-Z0-9-]*)\.html">.*,\1 \2,gp' \
    | sort) \
  -
