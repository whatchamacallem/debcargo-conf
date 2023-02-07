#!/bin/sh

set -e

parsec -V | egrep -q '^parsec-service [0-9]\.[0-9]\.[0-9]$'
