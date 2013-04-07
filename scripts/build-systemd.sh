#!/bin/sh -x

# MODULE
SRCDIR=systemd

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
./autogen.sh && \
./configure CFLAGS='-g -O0' \
--sysconfdir=/etc \
--localstatedir=/var \
--libdir=/usr/lib \
--enable-gtk-doc  \
--with-rootlibdir=/lib \
--with-rootprefix= && \
make V=1 -j8 && \
make V=1 DESTDIR=$ROOTFS install \
|| exit 1
