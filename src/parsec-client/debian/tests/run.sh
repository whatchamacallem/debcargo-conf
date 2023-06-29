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

/usr/share/cargo/bin/cargo-auto-test $@
