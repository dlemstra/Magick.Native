#!/bin/bash
set -e

cd lzma
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-doc --disable-nls --disable-xz --disable-xzdec CFLAGS="$FLAGS"
$MAKE install
