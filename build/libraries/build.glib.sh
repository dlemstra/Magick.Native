#!/bin/bash
set -e

cd glib

rm gio/gioenumtypes.c
rm gio/gioenumtypes.h
rm gio/gnetworking.h
rm glib/config.h
rm glib/glibconfig.h
rm glib/gnulib/gnulib_math.h
rm gmodule/gmoduleconf.h
rm gobject/glib-enumtypes.h

mkdir __build
cd __build
export CFLAGS="$FLAGS"
meson $MESON_OPTIONS --prefix=/usr/local --buildtype=$MESON_BUILD_TYPE --default-library=static -Dselinux=disabled -Dxattr=false -Dlibmount=disabled -Dnls=disabled -Dinternal_pcre=true -Dgtk_doc=false -Dman=false ..
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
if [ -d /usr/local/lib/x86_64-linux-gnu/pkgconfig ]; then
  mv /usr/local/lib/x86_64-linux-gnu/pkgconfig/*.pc $PKG_PATH
fi
chmod 755 /usr/local/bin/glib-genmarshal
chmod 755 /usr/local/bin/glib-mkenums
