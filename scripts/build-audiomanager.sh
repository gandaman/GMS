#!/bin/sh -x

# MODULE
SRCDIR=AudioManager

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
cmake -DCMAKE_INSTALL_PREFIX=$ROOTFS && \
make VERBOSE=1 -j8 && \
make VERBOSE=1 install && \
{
   set +x
   echo "NOTE!"
   echo "-----  Currently, AudioManager installs tests to ~/AudioManagerTests, not"
   echo "-----  to our target root filesystem. If you want to use them in the"
   echo "-----  target system, move them manually, or suggest some additional"
   echo "-----  patch to fix this"
   echo "NOTE!"
} \
|| exit 1
