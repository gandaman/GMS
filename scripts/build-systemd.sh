#!/bin/sh -x

# MODULE
SRCDIR=systemd

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
buildstep ./autogen.sh
buildstep ./configure CFLAGS='-g -O0' \
                      --sysconfdir=/etc \
                      --localstatedir=/var \
                      --libdir=/usr/lib \
                      --enable-gtk-doc  \
                      --with-rootlibdir=/lib \
                      --with-rootprefix= 
buildstep make V=1 -j8
buildstep make V=1 DESTDIR=$ROOTFS install
