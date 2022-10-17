#!/bin/bash
set -e

cd brotli
mkdir __build
cd __build
$CMAKE_COMMAND .. -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=false -DBROTLI_DISABLE_TESTS=true -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_C_FLAGS="$FLAGS -DBROTLI_EXTERNAL_DICTIONARY_DATA"
$MAKE install

# need this for jpeg-xl
ln -s /usr/local/lib/libbrotlicommon-static.a /usr/local/lib/libbrotlicommon.a
ln -s /usr/local/lib/libbrotlidec-static.a /usr/local/lib/libbrotlidec.a
ln -s /usr/local/lib/libbrotlienc-static.a /usr/local/lib/libbrotlienc.a
