#!/bin/sh -x

# MODULE
SRCDIR=dlt-daemon

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
buildstep rm -rf build 
buildstep mkdir -p build 
buildstep cd build 
buildstep cmake -DCMAKE_INSTALL_PREFIX=$ROOTFS .. 
buildstep make V=1 -j8 
buildstep make V=1 install
