#!/bin/bash
set -e

cd tiff
autoreconf -fiv
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
echo '' > version
$MAKE install
