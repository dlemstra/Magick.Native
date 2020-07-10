#!/bin/bash
set -e

cd croco
autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
