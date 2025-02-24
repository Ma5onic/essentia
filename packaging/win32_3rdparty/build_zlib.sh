#!/usr/bin/env bash
set -e
. ../build_config.sh

rm -rf tmp
mkdir tmp
cd tmp

echo "Building zlib $ZLIB_VERSION"

curl -SLO https://github.com/madler/zlib/releases/download/v$ZLIB_VERSION/zlib-$ZLIB_VERSION.tar.gz
tar -xzf zlib-$ZLIB_VERSION.tar.gz
cd zlib-$ZLIB_VERSION/


 CC=$HOST-gcc AR="$HOST-ar" RANLIB=$HOST-ranlib ./configure \
    --prefix=$PREFIX \
    --static

make
make install

cd ../..
rm -r tmp

