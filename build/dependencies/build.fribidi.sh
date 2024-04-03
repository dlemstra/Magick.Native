#!/bin/bash
set -e

cd fribidi

rm lib/fribidi-config.h

autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
