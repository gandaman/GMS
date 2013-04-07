#!/bin/sh -x

# MODULE
SRCDIR=persistence-client-library

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
autoreconf -vi && \
./configure --enable-tests --prefix=$ROOTFS && \
make V=1 -j8 && \
make V=1 install \
|| exit 1
