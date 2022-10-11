#!/bin/bash
set -e

cd cairo

rm src/cairo-features.h

autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-xlib --enable-quartz=no --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
