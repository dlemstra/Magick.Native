#!/bin/bash
set -e

cd fontconfig
autoreconf -fiv
chmod +x ./configure
pip3 install lxml
pip3 install six
$CONFIGURE $CONFIGURE_OPTIONS --enable-libxml2 --enable-static=yes --disable-shared $FONTCONFIG_OPTIONS CFLAGS="$FLAGS"
$MAKE install
