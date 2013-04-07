#!/bin/sh -x

# MODULE
SRCDIR=itzamc

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
./reconf --prefix=$ROOTFS && \
make -j8 && \
make install \
|| exit 1 

# It seems to me that "make install" of ItzamC does not install the 
# pkg-config file.  Not at all!?  Also with a standard make install.
#
# Installed ItzamC is currently required by persistence-client-library 

# Use IFS=: and pick the first path if there are several in PKG_CONFIG_PATH
( 
IFS=: 
   for d in $PKG_CONFIG_PATH ; do 
      cp libitzam.pc $d || exit 1
      exit
   done
)

