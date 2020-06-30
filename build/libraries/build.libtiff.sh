#!/bin/bash
set -e

cd tiff
autoreconf -fiv
$CONFIGURE ${CONDITIONAL_DISABLE_SHARED} CFLAGS="$FLAGS"
$MAKE install
