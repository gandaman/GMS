#!/bin/sh -x
# Copyright and License: See GMS project README

# MODULE
SRCDIR=busybox

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# FUNCTIONS
install_busybox() {
   mkdir -p $ROOTFS/{bin,sbin,usr/bin,usr/sbin}
   for d in bin sbin usr/bin usr/sbin ; do 
      cp -a -P _install/$d/* $ROOTFS/$d || return 1
   done
}

# MODULE SPECIFIC BUILD COMMANDS
buildstep make defconfig
buildstep make menuconfig
# Or add required features like this
#  sed -e 's/.*FEATURE_PREFER_APPLETS.*/CONFIG_FEATURE_PREFER_APPLETS=y/' -i .config
#  sed -e 's/.*FEATURE_SH_STANDALONE.*/CONFIG_FEATURE_SH_STANDALONE=y/' -i .config
buildstep make V=1 -j8
buildstep make V=1 install
buildstep install_busybox


