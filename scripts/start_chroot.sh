#!/bin/sh
# Copyright and License: See GMS project README

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# Set up necessary files to run a chroot
mkdir -p $ROOTFS/{tmp,lib,lib/i386-linux-gnu}

# Copy basic runtime stuff and various libs
# Paths may be Ubuntu specific?
cp /lib/ld-linux.so.* $ROOTFS/lib/

# TODO: Reduce to minimally required
cp /lib/i386-linux-gnu/* $ROOTFS/lib/i386-linux-gnu
cp /lib/i386-linux-gnu/lib{gcc_s,c,m,rt,pthread}.so* $ROOTFS/lib/i386-linux-gnu

cat <<EOT >$ROOTFS/etc/profile
echo
echo "Now running in chroot environment."
echo "Welcome to the GENIVI Minimal System!"
echo
EOT

[ -f $ROOTFS/bin/ash ] && \
sudo chroot $ROOTFS /bin/ash --login || \
sudo chroot $ROOTFS /bin/sh --login  
