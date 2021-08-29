#!/bin/bash
# Symlink {build => src}/$pkg/debian/patches for easier editing.
#
# If you give a second argument $2, will create this patch, add Cargo.toml to
# it, open it for editing, refresh the patch, and call cargo build for you.
#
# If the build succeeds, exits with success, and you can re-rerun update.sh
# If the build fails, will "quilt add" everything so you can begin editing the
# files without forgetting to add them.

set -e

pkg="$1"

if ! test -d "src/$pkg/debian"; then
	echo >&2 "not a directory: src/$pkg/debian"
	exit 1
fi

test -d "src/$pkg/debian/patches" || mkdir "src/$pkg/debian/patches"
rm -rf "build/$pkg/debian/patches"
rm -rf "build/$pkg/.pc"
mkdir -p "build/$pkg/debian"
ln -sfT "$PWD/src/$pkg/debian/patches" "build/$pkg/debian/patches"

if [ -z "$2" ]; then exit 0; fi

cd "build/$pkg"
export QUILT_PATCHES=debian/patches
patchname="${2%.patch}.patch"
quilt new "$patchname"
quilt add Cargo.toml
sensible-editor Cargo.toml
quilt refresh
find src -type f -execdir quilt add '{}' +

while ! cargo build --all-features; do

cat <<-eof
Spawning a sub-shell. Please try to fix the build failure by editing files in
src/, which have been already quilt-added for you to $patchname. Afterwards,
don't forgot to run "quilt refresh". To exit this loop without having fixed the
problem, press Ctrl-D then quickly Ctrl-C.
eof
$SHELL
quilt refresh

done

echo "patching was a success!"
