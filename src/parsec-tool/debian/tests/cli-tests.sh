#!/bin/bash
#
# Run the upstream testsuite (tests/parsec-cli-tests.sh)

set -e

function cleanup {
	kill $(cat /run/parsec.pid)
}

trap cleanup EXIT

parsec -c debian/tests/config.toml &
echo $! > /run/parsec.pid

sleep 3

PARSEC_SERVICE_ENDPOINT=unix:/run/parsec.sock PARSEC_TOOL=/usr/bin/parsec-tool tests/parsec-cli-tests.sh
