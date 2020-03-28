#!/bin/sh
for i in src/*/debian/RFS; do
    echo "$(git log -1 --pretty="format:%ct" "$i")" "$i"
done | sort  | while read t i; do
    pkg=$(basename "$(dirname "$(dirname "$i")")")
    if test -n "$(git --no-pager branch --remotes -l origin/pending-"$pkg")"; then
        # If a pending branch exists, skip it
        continue
    fi
    echo -e "$(date -d@"$t") \e[32m$pkg\e[0m"
    # trim the content
    content=$(xargs '-d\n' echo -n < "$i")
    if test -n "$content"; then
        echo "  $content"
    fi
done
