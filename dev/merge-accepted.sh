#!/bin/bash
packages=( $(dev/list-pending-not-NEW.sh | dev/filter-package-in-debian.sh | grep -v ' 0$' | cut '-d ' -f1) )
set -x

git merge "${packages[@]/#/pending-}"
git push origin master "${packages[@]/#/:pending-}"
dev/sync-pending-branches.sh
