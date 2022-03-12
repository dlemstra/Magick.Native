#!/bin/bash
set -e

cd raqm
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
