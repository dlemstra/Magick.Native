#!/bin/bash
set -e

cd liblzma
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-doc CFLAGS="$FLAGS"
$MAKE install
