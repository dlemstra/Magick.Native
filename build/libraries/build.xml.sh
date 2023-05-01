#!/bin/bash
set -e

cd xml

sed -i 's/1.16.3 //' configure.ac

rm -Rf config.h
rm -Rf include/libxml/xmlversion.h

autoreconf -fiv
$CONFIGURE $CONFIGURE_OPTIONS --with-python=no --enable-static --disable-shared $XML_OPTIONS CFLAGS="$FLAGS"
$MAKE install
