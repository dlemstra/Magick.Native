#!/bin/bash
set -e

cd heif
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS $HEIF_OPTIONS --disable-shared --disable-go --disable-examples --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
$MAKE install
