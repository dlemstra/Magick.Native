#!/bin/bash
set -e

cd harfbuzz
autoreconf -fiv
chmod +x ./configure
chmod +x ./src/gen-hb-version.py
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install
