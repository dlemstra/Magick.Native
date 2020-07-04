#!/bin/bash
set -e

cd glib
git reset 6caafa6ce0f85fc95a5238b564170e28be8d5223 --hard

rm gio/gioenumtypes.c
rm gio/gioenumtypes.h
rm gio/gnetworking.h
rm glib/config.h
rm glib/glibconfig.h
rm glib/gnulib/gnulib_math.h
rm gmodule/gmoduleconf.h
rm gobject/glib-enumtypes.h

mkdir build
cd build
export CFLAGS="$FLAGS"
meson --prefix=/usr/local --default-library=static -Dselinux=disabled -Dxattr=false -Dlibmount=disabled -Dnls=disabled -Dinternal_pcre=true -Dgtk_doc=false -Dman=false ..
ninja install

if [ -f /usr/local/lib/x86_64-linux-gnu/libglib-2.0.a ]; then
  cp /usr/local/lib/x86_64-linux-gnu/libglib-2.0.a /usr/local/lib/libglib-2.0.a
fi
