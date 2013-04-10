#!/bin/sh -x

# MODULE
SRCDIR=node-startup-controller

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

# MODULE SPECIFIC BUILD COMMANDS
test -d m4 || mkdir m4
buildstep gtkdocize
buildstep autoreconf -ivf
export SYSTEMD_DAEMON_LIBS="-L$GMS_ROOT/usr/lib -lsystemd-daemon"
export SYSTEMD_DAEMON_CFLAGS="-I$GMS_ROOT/systemd/src/ -I$GMS_ROOT/usr/lib/includes"

# There's seems to be a missing symlink to find -lsystemd-daemon
LIBSDD=libsystemd-daemon.so
if [ ! -e "$ROOTFS/lib/$LIBSDD" ] ; then
   cd "$ROOTFS/lib" && {
      if [ ! -f $LIBSDD.0 ] ; then
         echo "*** FATAL - expected $LIBSDD.0 in <ROOTFS>/lib?" 
         exit 1
      fi
      buildstep ln -s $LIBSDD.0 $LIBSDD 
      cd -
   }
fi

buildstep ./configure --prefix=$ROOTFS
buildstep make V=1 -j8
buildstep make V=1 install
