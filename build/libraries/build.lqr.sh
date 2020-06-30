#!/bin/bash
set -e

cd lqr
git reset 00eef3a3ebde9eb7fcfa481648d8c6c1d24b49a4 --hard
autoreconf -fiv
mkdir /usr/local/include/lqr-1
mkdir /usr/local/include/lqr-1/lqr
$CONFIGURE --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
