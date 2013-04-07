#!/bin/sh -x

# MODULE
SRCDIR=busybox

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
make defconfig && \
make menuconfig && \
# Or add required features like this
#  sed -e 's/.*FEATURE_PREFER_APPLETS.*/CONFIG_FEATURE_PREFER_APPLETS=y/' -i .config
#  sed -e 's/.*FEATURE_SH_STANDALONE.*/CONFIG_FEATURE_SH_STANDALONE=y/' -i .config
make V=1 -j8 && \
make V=1 install &&\
mkdir -p $ROOTFS/{bin,sbin,usr/bin,usr/sbin} && \
for d in bin sbin usr/bin usr/sbin ; do 
   cp -a -P _install/$d/* $ROOTFS/$d || exit 1
done \
|| exit 1

