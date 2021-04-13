#!/bin/bash
set -e

cd cairo

rm src/cairo-features.h

export GTKDOCIZE=true

autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --enable-quartz=no --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
