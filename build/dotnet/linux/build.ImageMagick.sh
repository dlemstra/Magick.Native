#!/bin/bash
set -e

export FLAGS="-O3 -fPIC"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export MAKE="make"

cd /src/ImageMagick/ImageMagick

# Build zlib
cd zlib
chmod +x ./configure
$CONFIGURE --static
$MAKE install CFLAGS="$FLAGS"

# Build libpng
cd ../png
autoreconf -fiv
$CONFIGURE --disable-mips-msa --disable-arm-neon --disable-powerpc-vsx --disable-shared
$MAKE install CFLAGS="$FLAGS"

cd ../ImageMagick
$CONFIGURE --disable-shared --disable-openmp --enable-static --enable-delegate-build --without-threads --without-magick-plus-plus --without-utilities --disable-docs --without-bzlib --without-lzma --without-x --with-quantum-depth=8 --disable-hdri PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
$MAKE install CFLAGS="$STRICT_FLAGS" CXXFLAGS="$STRICT_FLAGS"