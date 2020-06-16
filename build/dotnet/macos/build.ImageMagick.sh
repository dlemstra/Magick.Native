#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

export FLAGS="-O3 -fPIC"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CMAKE_COMMAND="cmake"
export MAKE="make"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export CONDITIONAL_DISABLE_SHARED=""
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=1"
export SSE_OPTIONS=""
export FONTCONFIG_BUILD=true
export HEIF_HACK=false
export LIBXML_OPTIONS=""
export PNG_PATCH=false
export WEBP_OPTIONS="--enable-libwebpmux --enable-libwebpdemux"
export IMAGEMAGICK_OPTIONS=""

# Build zlib
cd zlib
chmod +x ./configure
$CONFIGURE --static
$MAKE install CFLAGS="$FLAGS"

# Build libxml
cd ../libxml
autoreconf -fiv
$CONFIGURE --with-python=no --enable-static --disable-shared $LIBXML_OPTIONS CFLAGS="$FLAGS"
$MAKE install

# Build libpng
cd ../png
if [ "$PNG_PATCH" = true ]; then
    git apply $SCRIPT_PATH/patches/png.patch
fi
autoreconf -fiv
$CONFIGURE --disable-mips-msa --disable-arm-neon --disable-powerpc-vsx --disable-shared CFLAGS="$FLAGS"
$MAKE install

# Build freetype
cd ../freetype
./autogen.sh
$CONFIGURE --disable-shared --without-bzip2 CFLAGS="$FLAGS"
$MAKE install
make clean
mkdir build
cd build
$CMAKE_COMMAND .. -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_SHARED=off -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
cd ..

# Build fontconfig
if [ "$FONTCONFIG_BUILD" = true ]; then
    cd ../fontconfig
    autoreconf -fiv
    pip install lxml
    pip install six
    $CONFIGURE --enable-libxml2 --enable-static=yes --disable-shared CFLAGS="$FLAGS"
    $MAKE install
fi

# Build libjpeg-turbo
cd ../jpeg
$CMAKE_COMMAND . -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_SHARED=off ${SIMD_OPTIONS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install

# Build libtiff
cd ../tiff
autoreconf -fiv
$CONFIGURE ${CONDITIONAL_DISABLE_SHARED} CFLAGS="$FLAGS"
$MAKE install

# Build libwebp
cd ../webp
autoreconf -fiv
chmod +x ./configure
$CONFIGURE ${WEBP_OPTIONS} --disable-shared CFLAGS="${FLAGS}"
$MAKE install

# Build openjpeg
cd ../openjpeg
$CMAKE_COMMAND . -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS" || true
$CMAKE_COMMAND . -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
cp bin/libopenjp2.a /usr/local/lib

# Build lcms
cd ../lcms
autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install

# Build libde265
cd ../libde265
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared $SSE_OPTIONS --disable-dec265 --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install

# Build libheif
cd ../libheif
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-go --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
if [ "$HEIF_HACK" = true ]; then
    for f in examples/*.cc; do echo "" > $f; done
fi
$MAKE install

# Build libraw
cd ../libraw
chmod +x ./version.sh
chmod +x ./shlib-version.sh
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-examples --disable-openmp --disable-jpeg --disable-jasper --prefix=/usr/local  CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install

buildImageMagick() {
    local quantum=$1

    # Set ImageMagick variables
    local hdri=no
    local depth=8
    if [ "$quantum" == "Q16" ]; then
        depth=16
    elif [ "$quantum" == "Q16-HDRI" ]; then
        quantum_name=Q16HDRI
        depth=16
        hdri=yes
    fi

    $CONFIGURE --disable-shared --disable-openmp --enable-static --enable-delegate-build --without-magick-plus-plus --without-utilities --disable-docs --without-bzlib --without-lzma --without-x --with-quantum-depth=$depth --enable-hdri=$hdri $IMAGEMAGICK_OPTIONS CFLAGS="$STRICT_FLAGS" CXXFLAGS="$STRICT_FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
    $MAKE install
}

# Build ImageMagick
cd ../ImageMagick
autoreconf -fiv
buildImageMagick "Q8"
buildImageMagick "Q16"
buildImageMagick "Q16-HDRI"
