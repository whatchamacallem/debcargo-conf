#!/bin/bash

set -ex

RUNDIR="/run/parsec"

function cleanup {
    if [ -f "${RUNDIR}/parsec.pid" ]; then
        kill "$(cat ${RUNDIR}/parsec.pid)"
    fi
    rm -r $RUNDIR
}

trap cleanup EXIT

mkdir -p ${RUNDIR}

parsec -c debian/tests/config.toml &
echo $! > ${RUNDIR}/parsec.pid

sleep 3

/usr/share/cargo/bin/cargo-auto-test "$@"
