#!/bin/bash
set -e

cd png
autoreconf -fiv
$CONFIGURE --disable-mips-msa --disable-arm-neon --disable-powerpc-vsx --disable-shared CFLAGS="$FLAGS"
$MAKE install
