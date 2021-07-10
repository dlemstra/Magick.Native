#!/bin/bash
set -e

cd raqm
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
