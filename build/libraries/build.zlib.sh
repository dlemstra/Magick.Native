#!/bin/bash
set -e

cd zlib
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --static
$MAKE install CFLAGS="$FLAGS"
