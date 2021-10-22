#!/bin/bash
# Sync remote pending branches locally, and prune merged branches.
set -e

git_hash() {
	git rev-parse -q --verify "$@" || true
}

git fetch origin --prune
PREVBRANCH="$(git rev-parse --abbrev-ref HEAD)"

# delete merged
git branch --merged | tr -d ' ' | grep ^pending- | xargs -trn1 git branch -d
merged=( $(git branch --list -r 'origin/pending-*' --format='%(refname:lstrip=3)' --merged) )
git push origin "${merged[@]/#/:}"

# sync local branches
git branch --list -r 'origin/pending-*' --format='%(refname:lstrip=3)' | while read b; do
	if [ -z "$(git_hash "$b")" ]; then
		git checkout "$b"
	fi
done
git checkout "$PREVBRANCH"
git branch --list 'pending-*'  --format='%(refname:lstrip=2)' | while read b; do
	if [ "$(git_hash "$b")" != "$(git_hash "origin/$b")" ]; then
		echo >&2 "WARNING: Local $b ($(git_hash "$b")) differs from remote $b ($(git_hash "origin/$b"))"
	fi
done
