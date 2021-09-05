#!/bin/bash
set -e

cd fontconfig
autoreconf -fiv
chmod +x ./configure
pip install lxml
pip install six
$CONFIGURE --enable-libxml2 --enable-static=yes --disable-shared $FONTCONFIG_OPTIONS CFLAGS="$FLAGS"
$MAKE install
