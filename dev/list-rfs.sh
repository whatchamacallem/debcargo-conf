#!/bin/sh
for i in src/*/debian/RFS; do
	pkg=$(basename $(dirname $(dirname $i)))
    if test -n "$(git --no-pager branch --remotes -l origin/pending-$pkg)"; then
        # If a pending branch exists, skip it
        continue
    fi
    echo $pkg
    # trim the content
    content=$(cat $i|xargs echo -n)
    if test -n "$content"; then
        echo "=> $content"
    fi
done
