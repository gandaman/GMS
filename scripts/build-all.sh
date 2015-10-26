#!/bin/sh -x
# Copyright and License: See GMS project README

SRCDIR=""

# STD SETUP
SCRIPTDIR=$(dirname "$0") ; . $SCRIPTDIR/build-common.sh

failures=""
cd $GMS_ROOT
scripts/build-dlt-daemon.sh   || failures+="build-dlt-daemon.sh, "
scripts/build-systemd.sh      || failures+="build-systemd.sh, "
scripts/build-itzamc.sh       || failures+="build-itzamc.sh, "
scripts/build-pcl.sh          || failures+="build-pcl.sh, "
scripts/build-nsm.sh          || failures+="build-nsm.sh, "
scripts/build-nsc.sh          || failures+="build-nsc.sh, "
scripts/build-audiomanager.sh || failures+="build-audiomanager.sh, "
scripts/build-busybox.sh      || failures+="build-busybox.sh, "

set +x
if [ -n "$failures" ] ; then
   echo "===================================="
   echo "*** WARNING "
   echo "*** The following builds failed:"
   echo "*** $failures"
   echo "===================================="
   exit 1
else
   echo "===================================="
   echo "= All OK (No known build failures) =" 
   echo "===================================="
fi

if [ -z "$failures" ] ; then
   echo
   read -p "Start chroot system? (yes) : " reply
   case "$reply" in 
      ""|y|Y|yes|Yes)
         scripts/start_chroot.sh
         ;;
      *)
         echo OK, just run scripts/start_chroot.sh later
   esac
fi
   
