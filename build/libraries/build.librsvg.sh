#!/bin/bash
set -e

cd librsvg

export GLIB_MKENUMS="/usr/local/bin/glib-mkenums"
export GLIB_GENMARSHAL="/usr/local/bin/glib-genmarshal"

rm gdk-pixbuf/gdk-pixbuf/config.h
rm config.h

cd gdk-pixbuf

autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --with-included-loaders=yes --enable-modules=no --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
cd ..

autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-Bsymbolic --disable-introspection --disable-pixbuf-loader --prefix=/usr/local CFLAGS="$FLAGS -I/usr/local/include/libcroco-0.6/libcroco"
$MAKE install
