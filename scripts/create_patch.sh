#!/bin/sh

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

TMPNAME=patches/new-patch-rename-me.$$.patch

cd $GMS_ROOT

[ -z "$1" ] && { C=$(basename "$0") ; echo "Usage: $C <path-to-original>" ; exit 1 ; }

[ ! -f "$1" ] && { echo "Can't find file $1" ; exit 1 ; }
[ ! -f "patched/$1" ] && { echo "There should be a modified version in patched/" ; echo "Can't find file patched/$1" ; exit 1 ; }

diff -u "$1" "patched/$1" 
#diff -u "$1" "patched/$1" >/dev/null || { echo "diff failed" ; exit 1 ; }
diff -u "$1" "patched/$1" >$TMPNAME

[ -f "$TMPNAME" ] && { echo "***" ; echo "*** New patch stored in $TMPNAME" ; echo "***" ; }
