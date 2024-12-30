#!/bin/bash
set -e

cd openh264

mkdir __build
cd __build
export CFLAGS="$FLAGS"
meson $MESON_OPTIONS --prefix=/usr/local --buildtype=$MESON_BUILD_TYPE --default-library=static ..
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
if [ -d /usr/local/lib/x86_64-linux-gnu/pkgconfig ]; then
  mv /usr/local/lib/x86_64-linux-gnu/pkgconfig/*.pc $PKG_PATH
fi
