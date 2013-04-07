#!/bin/sh
version=6.0.4
package=libitzam-$version
tarball=$package.tar.gz
url=http://www.coyotegulch.com/products/itzam/c/$tarball

MYDIR=$(dirname "$0")
cd "$MYDIR" && \

[ -d src -a -f configure ] && { echo "This directory seems to include Itzam already.  Skipping download/unpack." ; cd - >/dev/null ; exit 0 ; } 

wget --help >/dev/null || { echo "Need wget to fetch ItzamC.  Giving up." ; exit 1 ; }

wget -c $url && \
tar xf $tarball || { echo "Unpack tarball failed.  Giving up." ; cd - ; exit 1 ; }
[ -d $package ] || { echo "Something wrong.  Expected to unpack to directory $package.  Please check. " ; cd - >/dev/null ; exit 1 ; }
mv $package/* . && \
rmdir $package && \
{
cat <<EOT >GMS_README
The content was unpacked from $tarball
($url)
EOT
}
cd -

