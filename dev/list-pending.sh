#!/bin/bash
# List pending branches that we have.
# You may want to run dev/sync-pending-branches.sh first.
# You may find it useful to pipe the output of this into filter-package-in-debian.sh
#
set -e

git fetch origin --prune

if [ "${PENDING_LOCAL}" = 1 ]; then
git branch --list 'pending-*' --format='%(refname)' \
  | sed -e 's,refs/heads/pending-,,g' \
  | sort \
  | while read x; do
	echo $x $(git show "pending-$x:src/$x/debian/changelog" | dpkg-parsechangelog -l- -SVersion)
  done
else
git branch --list -r 'origin/pending-*' --format='%(refname)' \
  | sed -e 's,refs/remotes/origin/pending-,,g' \
  | sort \
  | while read x; do
	echo $x $(git show "origin/pending-$x:src/$x/debian/changelog" | dpkg-parsechangelog -l- -SVersion)
  done
fi
