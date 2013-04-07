#!/bin/sh

if [ ! -d .git ] ; then
   echo "Please run script from the project root, i.e. :  $ scripts/<scriptfile>"
   exit 1
fi

echo "*************************************************************"
echo "Submodules"
echo "*************************************************************"
# Get the submodules
git submodule init
git submodule update

echo "*************************************************************"
echo "Itzam/C"
echo "*************************************************************"
# Download ItzamC
itzamc/get.sh

echo "*************************************************************"
echo "Patches"
echo "*************************************************************"
# Apply all patches
for p in $(find patches/ -type f -name '*.patch') ; do
   patch -p1 <$p -N -r - -s 2>&1 | egrep -v "hunk ignored"
done
