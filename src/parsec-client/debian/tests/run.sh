#!/bin/bash

set -ex

function cleanup {
    kill $(cat /run/parsec/parsec.pid)
    rm -r /run/parsec
}

trap cleanup EXIT

mkdir /run/parsec

parsec -c debian/tests/config.toml &
echo $! > /run/parsec/parsec.pid

sleep 3

version="$(apt-cache policy librust-parsec-client-dev | grep -F 'Installed: ' | grep -oE '[0-9]+\.[0-9]+\.[0-9]+')"

/usr/share/cargo/bin/cargo-auto-test $@
