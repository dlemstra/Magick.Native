#!/bin/bash
set -e

cd tiff
autoreconf -fiv
$CONFIGURE $CONFIGURE_OPTIONS $CONDITIONAL_DISABLE_SHARED CFLAGS="$FLAGS"
echo '' > version
$MAKE install
