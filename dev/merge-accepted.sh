#!/bin/bash
set -e

packages=( $(dev/list-pending.sh | dev/filter-package-in-debian.sh | grep -v ' 0$' | cut '-d ' -f1) )

if [ -z "$packages" ]; then exit 0; fi
set -x

git fetch origin --prune
git diff --quiet origin/master || \
{ echo >&2 "Please sync with origin/master before running this."; exit 1; }

git merge "${packages[@]/#/pending-}"
git push origin master
if [ "${PENDING_LOCAL}" != 1 ]; then
  git push origin "${packages[@]/#/:pending-}"
fi
dev/sync-pending-branches.sh
