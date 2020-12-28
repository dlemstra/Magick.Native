#!/bin/bash
set -e

cd brotli
mkdir __build
cd __build
$CMAKE_COMMAND .. -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
