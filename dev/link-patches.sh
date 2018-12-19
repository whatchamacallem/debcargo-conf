#!/bin/sh
# Symlink {build => src}/$pkg/debian/patches for easier editing.
set -e

pkg="$1"

if ! test -d "src/$pkg/debian"; then
	echo >&2 "not a directory: src/$pkg/debian"
	exit 1
fi

test -d "src/$pkg/debian/patches" || mkdir "src/$pkg/debian/patches"
rm -rf "build/$pkg/debian/patches"
rm -rf "build/$pkg/.pc"
ln -sfT "$PWD/src/$pkg/debian/patches" "build/$pkg/debian/patches"
