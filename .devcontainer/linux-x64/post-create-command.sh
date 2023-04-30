#!/bin/bash
set -e

rm -f libraries
ln -s /ImageMagick/libraries libraries

cd src/Magick.Native
../../build/shared/build.Native.sh linux x64
