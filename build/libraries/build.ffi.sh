#!/bin/bash
set -e

cd ffi

rm include/ffi.h
rm include/fficonfig.h

autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-docs $FFI_OPTIONS CFLAGS="$FLAGS"
$MAKE install
