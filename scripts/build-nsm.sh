#!/bin/sh -x

# MODULE
SRCDIR=node-state-manager

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
./autogen.sh --prefix=$PWD/../rootfs --with-dbuspolicydir=$PWD/../rootfs --with-dbussystemunitdir=$PWD/../rootfs && \
make V=1 -j8 && \
make V=1 install \
|| exit 1
