#!/bin/bash
set -e

cd lcms
autoreconf -fiv
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
