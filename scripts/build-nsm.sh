#!/bin/sh -x
# Copyright and License: See GMS project README

# MODULE
SRCDIR=node-state-manager

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
buildstep ./autogen.sh --prefix=$ROOTFS                 \
                       --with-dbuspolicydir=$ROOTFS     \
                       --with-dbussystemunitdir=$ROOTFS
buildstep make V=1 -j8
buildstep make V=1 install
