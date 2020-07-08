#!/bin/bash
set -e

cd cairo

rm src/cairo-features.h

autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
