#!/bin/bash
set -e

cd pixman
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
