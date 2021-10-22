#!/bin/sh
dev/list-pending.sh | dev/filter-not-NEW.sh | dev/filter-package-in-debian.sh
