#!/bin/bash
set -e

cd /src/ImageMagick/ImageMagick

# Build zlib
cd zlib
chmod +x ./configure
export CFLAGS="-O3 -fPIC"
./configure --static
make install

cd ../ImageMagick
./configure CFLAGS="-fPIC -Wall -O3" CXXFLAGS="-fPIC -Wall -O3" --disable-shared --disable-openmp --enable-static --enable-delegate-build --with-magick-plus-plus=no --with-utilities=no --disable-docs --with-bzlib=no --with-lzma=no --with-x=no --with-quantum-depth=8 --enable-hdri=no
make install