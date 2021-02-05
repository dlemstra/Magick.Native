#!/bin/bash
set -e

cd liblzma
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-doc CFLAGS="$FLAGS"
$MAKE install
