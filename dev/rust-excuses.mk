#!/usr/bin/make -f
# Output a nice graph of why stuff isn't yet in Debian Testing.
#
# - Red oval nodes means it's not in Debian
# - Yellow oval nodes means it's in Debian, but something else needs a
#   different version of it.
# - For nodes with no children, it probably means that there is an older
#   version already in Debian Testing, and something else needs this specific
#   older version and can't work with the newer version. Unfortunately the
#   excuses page gives no more details about this, and you will have to ask
#   #debian-release to help you interpret https://release.debian.org/britney/update_output.txt
#
# Usage:
# $ dev/rust-excuses.mk refresh all

DST = rust-excuses.png rust-excuses-arch.png rust-regressions.list
DOWNLOAD = wget -N --no-use-server-timestamps https://release.debian.org/britney/excuses.yaml

all: $(DST)

clean:
	rm -rf $(DST) $(DST:%.png=%.dot) excuses.yaml

excuses.yaml:
	$(DOWNLOAD)

rust-excuses.dot rust-excuses-arch.dot rust-regressions.list: excuses.yaml dev/rust-excuses.py
	dev/rust-excuses.py rust-excuses.dot rust-excuses-arch.dot rust-regressions.list

%.png: %.dot
	unflatten -c 10 "$<" | dot -Tpng > "$@"

refresh:
	$(DOWNLOAD)
.PHONY: refresh
