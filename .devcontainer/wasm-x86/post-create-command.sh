#!/bin/bash
set -e

rm -f libraries
ln -s /ImageMagick/libraries libraries

cd src/Magick.Native
../../build/shared/build.Native.sh wasm x86

# we don't want to build this in the devcontainer
touch Q8/magick.d.ts

../../build/wasm-x86/copy.Native.sh
