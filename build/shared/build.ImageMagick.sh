#!/bin/bash
set -e

config=$1
arch=$2
openmp=$3

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$arch/settings.sh

buildImageMagick() {
    local quantum=$1

    # Set ImageMagick variables
    local hdri=no
    local depth=8
    local disable_openmp=--disable-openmp
    if [ "$quantum" == "Q16" ]; then
        depth=16
    elif [ "$quantum" == "Q16-HDRI" ]; then
        quantum_name=Q16HDRI
        depth=16
        hdri=yes
    fi
    if [ "$openmp" == "OpenMP" ]; then
        unset disable_openmp
    fi

    $CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-opencl --disable-assert --enable-static --enable-delegate-build --without-magick-plus-plus --without-utilities --disable-docs --without-x --with-rsvg --with-jxl --with-quantum-depth=$depth --enable-hdri=$hdri $disable_openmp $IMAGEMAGICK_OPTIONS CFLAGS="$STRICT_FLAGS" CXXFLAGS="$STRICT_FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
    $MAKE install
}

copyPrivateIncludes() {
    local imageMagickInclude=`pkg-config --variable includedir ImageMagick`
    cp MagickCore/*-private.h $imageMagickInclude/MagickCore/
    if [ ! -d $imageMagickInclude/coders ]; then
        mkdir $imageMagickInclude/coders
    fi
    cp coders/*-private.h $imageMagickInclude/coders/
}

cd ImageMagick

if [ "$config-$arch" == "linux-x64" ]; then
    # Disable getentropy because this requires GLIBC_2.25.
    sed -i's/MAGICKCORE_HAVE_GETENTROPY/DISABLED_MAGICKCORE_HAVE_GETENTROPY/g' MagickCore/random.c
fi

autoreconf -fiv
for quantum in ${QUANTUMS[@]}; do
    buildImageMagick $quantum
done
copyPrivateIncludes
