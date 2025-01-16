#!/usr/bin/env bash
#
# $@: optionally provided crates to check for

check_command() {
    if [[ "$(command -v $@ | wc -l)" -ne $# ]]; then
        echo This script needs $@ to work.
        exit 1
    fi
}

check_command curl jq

pushd src >/dev/null

if [ ${#@} -eq 0 ]; then
	names="$(ls | grep --invert-match --perl-regexp '\w-\d')"
else
	names=$@
fi

echo -e "crate\tpackaged\tcrates.io"
for name in $names; do
    if [ ! -e $name/debian/changelog ]; then
        continue
    fi
    curver=$(head -n1 $name/debian/changelog | tr -d '()' | awk '{print $2}' | awk -F- '{print $1}')
    latestver=$(curl -sSL https://crates.io/api/v1/crates/$name | jq .versions[0].num | tr -d '"')
    if [ "$curver" != "$latestver" ]; then
        echo -e "$name\t$curver\t$latestver"
    fi
done

popd >/dev/null
