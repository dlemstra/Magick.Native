#!/bin/bash
set -e

cd harfbuzz
git reset 1bbf25a80e8a3a51c5ebb700b07d5ef0216bd148 --hard
autoreconf -fiv
$CONFIGURE --disable-shared --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install
