#!/bin/bash
set -e

cd webp
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS $WEBP_OPTIONS --disable-shared --disable-png --disable-jpeg --disable-tiff CFLAGS="$FLAGS"
$MAKE install
