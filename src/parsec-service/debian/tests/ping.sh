#!/bin/bash

set -e

# Parsec uses a binary protocol described at:
# https://parallaxsecond.github.io/parsec-book/parsec_client/wire_protocol.html
# The following variables contain the base64 encoding of a ping and a pong:
ENCODED_PING="EKfAXh4AAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAA"
ENCODED_PONG="EKfAXh4AAQAAAAAAAAAAAAAAAAAAAAIAAAAAAAEAAAAAAAAACAE="

function cleanup {
    kill $(cat /run/parsec.pid)
}

trap cleanup EXIT

parsec -c debian/tests/config.toml &
echo $! > /run/parsec.pid

sleep 3

echo $ENCODED_PING | base64 --decode | nc -U /run/parsec.sock | base64 | grep -q $ENCODED_PONG
