#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/settings.sh

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

    $CONFIGURE --disable-shared --disable-opencl --disable-assert --enable-static --enable-delegate-build --without-magick-plus-plus --without-utilities --disable-docs --without-x --with-rsvg --with-jxl --with-quantum-depth=$depth --enable-hdri=$hdri $IMAGEMAGICK_OPTIONS CFLAGS="$STRICT_FLAGS" CXXFLAGS="$STRICT_FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
    $MAKE install
}

copyPrivateIncludes() {
    local imageMagickInclude=`pkg-config --variable includedir ImageMagick`
    cp MagickCore/*-private.h $imageMagickInclude/MagickCore/
    mkdir $imageMagickInclude/coders
    cp coders/*-private.h $imageMagickInclude/coders/
}

# Build ImageMagick
cd ImageMagick
autoreconf -fiv
buildImageMagick "Q8"
buildImageMagick "Q16"
buildImageMagick "Q16-HDRI"
copyPrivateIncludes
