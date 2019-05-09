#!/bin/bash
set -e

export FLAGS="-O3 -fPIC"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CMAKE_CONFIGURE="cmake"
export MAKE="make"
export SIMD_FLAG="-DWITH_SIMD=1"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export CONDITIONAL_DISABLE_SHARED=""

cd /src/ImageMagick/ImageMagick

# Build zlib
cd zlib
chmod +x ./configure
$CONFIGURE --static
$MAKE install CFLAGS="$FLAGS"

# Build libxml
cd ../libxml
autoreconf -fiv
$CONFIGURE --with-python=no --enable-static --disable-shared CFLAGS="$FLAGS"
$MAKE install

# Build libpng
cd ../png
autoreconf -fiv
$CONFIGURE --disable-mips-msa --disable-arm-neon --disable-powerpc-vsx --disable-shared CFLAGS="$FLAGS"
$MAKE install

# Build libjpeg-turbo
cd ../jpeg
$CMAKE_CONFIGURE . -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_SHARED=off ${SIMD_FLAG} -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install

# Build libtiff
cd ../tiff
autoreconf -fiv
$CONFIGURE ${CONDITIONAL_DISABLE_SHARED} CFLAGS="$FLAGS"
$MAKE install

# Build libwebpmux/demux
cd ../webp
autoreconf -fiv
$CONFIGURE --enable-libwebpmux --enable-libwebpdemux --disable-shared CFLAGS="${FLAGS}"
$MAKE install

# Build openjpeg
cd ../openjpeg
$CMAKE_CONFIGURE . -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS" || true
$CMAKE_CONFIGURE . -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
cp bin/libopenjp2.a /usr/local/lib

# Build lcms
cd ../lcms
autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install

# Build libraw
cd ../libraw
chmod +x ./version.sh
chmod +x ./shlib-version.sh
autoreconf -fiv
$CONFIGURE --disable-shared --disable-examples --disable-openmp --disable-jpeg --disable-jasper --prefix=/usr/local  CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install

# Build ImageMagick
cd ../ImageMagick
$CONFIGURE --disable-shared --disable-openmp --enable-static --enable-delegate-build --without-threads --without-magick-plus-plus --without-utilities --disable-docs --without-bzlib --without-lzma --without-x --with-quantum-depth=8 --disable-hdri  CFLAGS="$STRICT_FLAGS" CXXFLAGS="$STRICT_FLAGS" PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
$MAKE install