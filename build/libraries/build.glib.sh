#!/bin/bash
set -e

cd glib
git reset 407b61cd1eefdc4945b485849d5ee0709e55524c --hard

rm glib/config.h
rm glib/glibconfig.h
rm gmodule/gmoduleconf.h

mkdir build
cd build
export CFLAGS="$FLAGS"
meson --prefix=/usr/local --default-library=static -Dselinux=disabled -Dxattr=false -Dlibmount=disabled -Dnls=disabled -Dinternal_pcre=true -Dgtk_doc=false -Dman=false ..
ninja install

if [ -f /usr/local/lib/x86_64-linux-gnu/libglib-2.0.a ]; then
  cp /usr/local/lib/x86_64-linux-gnu/libglib-2.0.a /usr/local/lib/libglib-2.0.a
fi
