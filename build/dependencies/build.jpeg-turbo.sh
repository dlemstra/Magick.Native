#!/bin/bash
set -e

cd jpeg-turbo

rm src/jconfig.h
rm src/jconfigint.h
rm src/jversion.h

$CMAKE_COMMAND . $CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_SHARED=off $SIMD_OPTIONS -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
