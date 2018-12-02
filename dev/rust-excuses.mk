#!/usr/bin/make -f
# Output a nice graph of why stuff isn't yet in Debian Testing.
#
# Usage:
# $ dev/rust-excuses.mk refresh all

DST = rust-excuses.png rust-excuses-arch.png
DOWNLOAD = wget -N --no-use-server-timestamps https://release.debian.org/britney/excuses.yaml

all: $(DST)

clean:
	rm -rf $(DST) $(DST:%.png=%.dot) excuses.yaml

excuses.yaml:
	$(DOWNLOAD)

rust-excuses.dot rust-excuses-arch.dot: excuses.yaml dev/rust-excuses.py
	dev/rust-excuses.py rust-excuses.dot rust-excuses-arch.dot

%.png: %.dot
	dot -Tpng "$<" > "$@"

refresh:
	$(DOWNLOAD)
.PHONY: refresh
