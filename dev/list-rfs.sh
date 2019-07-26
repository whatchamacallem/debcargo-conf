#!/bin/sh
for i in src/*/debian/RFS; do
	basename $(dirname $(dirname $i))
done
