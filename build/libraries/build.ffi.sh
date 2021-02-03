#!/bin/bash
set -e

cd ffi
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-docs CFLAGS="$FLAGS"
$MAKE install
