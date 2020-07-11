#!/bin/bash
set -e

cd harfbuzz
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install
