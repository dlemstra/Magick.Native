#!/bin/bash
set -e

cd jpeg-xl
rm lib/include/jxl/jxl_export.h
mkdir __build
cd __build
$CMAKE_COMMAND .. -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_TESTING=off -DCMAKE_BUILD_TYPE=Release -DJPEGXL_STATIC=true -DJPEGXL_ENABLE_SKCMS=false -DJPEGXL_FORCE_SYSTEM_HWY=true -DJPEGXL_FORCE_SYSTEM_BROTLI=true -DJPEGXL_ENABLE_SJPEG=false -DJPEGXL_ENABLE_EXAMPLES=false -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
