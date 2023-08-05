#!/bin/sh

set -e

# Create an ITP for a crate on crates.io
#
# Copyright (C) 2023 Matthias Geiger <werdahias@riseup.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

CRATE=$1 # the crate that we want to itp
VERSION=$2
DEB_SRCNAME="" # name of the debian source rust- package
DEB_LIBNAME="" # name of the debian binary librust- package
LICENSE="" # License of the crate
URL="" # upstream repo for the crate
AUTHOR="" # upstream author(s)
DESCRIPTION="" # short description of the crate



# Check if crate and version are set, abort otherwise
# TODO: allow just the crate name
if [ -z "$1" ] || [ -z "$2" ] 
then echo "Error! Please specify crate name and version" && exit 0
fi

check_debname()
{	
	# change underscore to hyphen if it exists
	#if [ ! $(sed -n '/_/p' "$CRATE") ]
	#then CRATE=$(sed 's/_/-/g' "$CRATE")
	#fi
	# is this still needed ?
	#
	#
	DEB_SRCNAME="rust-$CRATE"
	DEB_LIBNAME="lib$DEB_SRCNAME-dev"
	# check if crate is in debian yet via apt cache (needs unstable in sources.list probably)
	# add check for sources.list ??
	if [ "$(apt-cache showpkg "$DEB_LIBNAME" | head -n1 | cut  -b 10-)" = "$DEB_LIBNAME" ] 
	then echo "$CRATE is already in Debian as package $DEB_LIBNAME. Exiting." && exit 1
	else ask_for_itp 
	fi
}

ask_for_itp()
{	
	# check if a rfp /itp has been filed yet using wnpp-check
	if [ "$(wnpp-check "$DEB_SRCNAME"; echo $?)" = 1 ]
	then echo "A wnpp bug has already been filed: $(echo $(wnpp-check $DEB_SRCNAME)). Exiting." && exit 1
	elif [ "$(wnpp-check "$DEB_SRCNAME"; echo $?)" = 0 ] 
	then echo "$CRATE is not yet in Debian. Do you want to file an ITP for it [Y/N] ?"
	read answer
	
	if [ "$answer" != "${answer#[Yy]}" ] ;
	then echo "filing ITP for $CRATE" && file_itp
	elif  [ "$answer" != "${answer#[Nn]}" ] ;
	then echo "Not filing an ITP for $CRATE. Exiting." && exit 0
	else echo "wrong argument! Usage: y/n" && exit 0
	fi
	fi
}

#get_sources()
#{	#need to add underscore check?
#	wget -q https://crates.io/api/v1/crates/$CRATE/$VERSION/download -Odebian-rust@lists.debian.org
#-- }

file_itp()
{
cat << EOF 
Package: wnpp
Severity: wishlist
Owner: $DEBFULLNAME <$DEBEMAIL>
X-Debbugs-Cc: debian-devel@lists.debian.org, debian-rust@lists.debian.org
* Package name    : rust-$CRATE
Version         : $VERSION
Upstream Author : $AUTHOR
* URL             : $URL
* License         : $LICENSE
Programming Lang: Rust
Description     : $DESCRIPTION - rust source code

I intend to package rust-$CRATE. This package will be maintained within the debian rust team.
Thanks,

$DEBFULLNAME

EOF
# >> itp-$CRATE.txt
# cat itp-$CRATE.txt
}
check_debname

