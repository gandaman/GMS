#!/bin/sh -x

# MODULE
SRCDIR=itzamc

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
buildstep ./reconf --prefix=$ROOTFS
buildstep make -j8
buildstep make install

# It seems to me that "make install" of ItzamC does not install the 
# pkg-config file.  Not at all!? Strange. Also with a standard make install.
#
# An installed ItzamC is currently required by persistence-client-library 

# Use IFS=: and pick the first path if there are several in PKG_CONFIG_PATH
# and put it there.
( 
IFS=: 
   for d in $PKG_CONFIG_PATH ; do 
      cp libitzam.pc $d || exit 1
      exit
   done
)

