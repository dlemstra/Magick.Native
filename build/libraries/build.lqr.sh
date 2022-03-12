#!/bin/bash
set -e

cd lqr
autoreconf -fiv
chmod +x ./configure
mkdir /usr/local/include/lqr-1
mkdir /usr/local/include/lqr-1/lqr
$CONFIGURE $CONFIGURE_OPTIONS --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
