#!/bin/sh
# Copyright and License: See GMS project README

if [ ! -d .git ] ; then
   echo "Please run script from the project root, i.e. :  $ scripts/<scriptfile>"
   exit 1
fi

fail() {
   echo "**********************************************************************"
   echo "Init step failed and continuing makes no sense. "
   echo "If this was a failed clone of submodule, maybe retry the script again."
   echo "If a module is consistently failing, try removing (rm -rf) the whole "
   echo "submodule directory and retry the script.  If all else fails, do the "
   echo "init steps manually (scripts/init.sh) for the other modules." 
   echo "**********************************************************************"
   exit 1
}

echo "*************************************************************"
echo "Submodules"
echo "*************************************************************"
# Get the submodules
git submodule init     || fail
git submodule update   || fail

echo "*************************************************************"
echo "Fetch non-git modules"
echo "*************************************************************"
# Download ItzamC
itzamc/get.sh   || fail

echo "*************************************************************"
echo "Patches"
echo "*************************************************************"
# Apply all patches
for p in $(find patches/ -type f -name '*.patch') ; do
   (patch -p1 <$p -N -r - -s 2>&1 && echo "Applied $p") \
   | grep -v "hunk ignored"
done
