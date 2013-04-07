#!/bin/sh -x

# MODULE
SRCDIR=dlt-daemon

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
rm -rf build && \
mkdir -p build && \
cd build && \
cmake -DCMAKE_INSTALL_PREFIX=$ROOTFS .. && \
make V=1 -j8 && \
make V=1 install \
|| exit 1
