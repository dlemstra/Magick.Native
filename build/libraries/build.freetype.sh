#!/bin/bash
set -e

cd freetype
./autogen.sh
$CONFIGURE --disable-shared --without-bzip2 CFLAGS="$FLAGS"
$MAKE install
