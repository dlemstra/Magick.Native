#!/bin/bash
set -e

cd heif
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-go --disable-examples --disable-tests --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
$MAKE install
