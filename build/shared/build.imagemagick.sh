#!/bin/bash
set -e

config=$1
architecture=$2
quantum=$3
openmp=$4

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$architecture/settings.sh

buildImageMagick() {
  local quantum=$1

  local hdri=no
  local depth=8
  local disable_openmp=--disable-openmp
  local enable_64bit_channel_masks="--enable-64bit-channel-masks --enable-force-cpp"
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
  if [ "$config" == "wasm" ]; then
    unset enable_64bit_channel_masks
  fi

  $CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-opencl --disable-dpc --disable-assert --disable-deprecated --enable-static --enable-delegate-build --without-magick-plus-plus --without-utilities --disable-docs --without-x --without-perl --without-python --without-magick-plus-plus --with-rsvg --with-jxl --with-quantum-depth=$depth --enable-hdri=$hdri $enable_64bit_channel_masks $disable_openmp $IMAGEMAGICK_OPTIONS --prefix=/tmp/ImageMagick
  $MAKE install
}

copyPrivateIncludes() {
  local imageMagickInclude="/tmp/ImageMagick/include/ImageMagick-7"
  cp MagickCore/*-private.h $imageMagickInclude/MagickCore/
  mkdir -p $imageMagickInclude/coders
  cp coders/*-private.h $imageMagickInclude/coders/
}

autoreconf -fiv
buildImageMagick $quantum
copyPrivateIncludes
