#!/bin/bash
# Given a full version string, output just the part that is significant for
# semver. i.e.. 0.x.* becomes 0.x and x.* becomes x for x != 0.
sed -r \
 -e 's/([1-9]+)\.[0-9]+\.[0-9]+/\1/g' \
 -e 's/(0\.[0-9]+)\.[0-9]+/\1/g'
