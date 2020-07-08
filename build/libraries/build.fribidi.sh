#!/bin/bash
set -e

cd fribidi
git reset f2d312d1292f356f8ce819ebe6c41b1e2081466b --hard
autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
