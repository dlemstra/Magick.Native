#!/bin/bash
set -e

cd lqr
git reset c0c7ce334c7643bb4128566053af27f3c85addf0 --hard
autoreconf -fiv
chmod +x ./configure
mkdir /usr/local/include/lqr-1
mkdir /usr/local/include/lqr-1/lqr
$CONFIGURE --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
