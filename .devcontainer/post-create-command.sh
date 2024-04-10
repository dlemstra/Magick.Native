#!/bin/bash
set -e

rm -f dependencies
ln -s /ImageMagick/imagemagick-windows dependencies

cd src/Magick.Native
../../build/shared/build.native.sh $DC_CONFIG $DC_ARCH $DC_OPEN_MP
../../build/shared/copy.native.sh ../../build/$DC_CONFIG-$DC_ARCH/output $DC_CONFIG $DC_ARCH $DC_OPEN_MP
