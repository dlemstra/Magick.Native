#!/bin/bash
set -e

cd lqr
git reset b047fbfba816c9511824782dae3841cf622dbca3 --hard
autoreconf -fiv
mkdir /usr/local/include/lqr-1
mkdir /usr/local/include/lqr-1/lqr
$CONFIGURE --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
