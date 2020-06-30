#!/bin/bash
set -e

cd lcms
autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
