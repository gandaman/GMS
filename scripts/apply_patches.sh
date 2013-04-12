#!/bin/sh
# Copyright and License: See GMS project README

# STD SETUP
D=$(dirname "$0") ; . "$D/build-common.sh"

# MODULE
cd $GMS_ROOT
for p in $(find patches/ -type f -name '*.patch') ; do
   # Pass flags like -N to the script -> will be forwarded to patch
   patch -p1 <$p $@
done
