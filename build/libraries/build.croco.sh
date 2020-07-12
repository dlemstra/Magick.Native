#!/bin/bash
set -e

cd croco
autoreconf -fiv
$CONFIGURE --disable-shared --disable-Bsymbolic --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
