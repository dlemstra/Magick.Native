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

mkdir build
cd build
export CFLAGS="$FLAGS"
meson --prefix=/usr/local --default-library=static -Dselinux=disabled -Dxattr=false -Dlibmount=disabled -Dnls=disabled -Dinternal_pcre=true -Dgtk_doc=false -Dman=false ..
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
chmod 755 /usr/local/bin/glib-mkenums
