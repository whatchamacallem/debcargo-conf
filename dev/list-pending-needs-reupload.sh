#!/bin/sh
dev/list-pending.sh | dev/filter-not-NEW.html | dev/filter-package-in-debian.sh
