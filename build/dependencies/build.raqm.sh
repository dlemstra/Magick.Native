#!/bin/bash
set -e

cd raqm
mkdir __build
cd __build
CFLAGS=$FLAGS meson setup .. $MESON_OPTIONS --buildtype=$MESON_BUILD_TYPE --prefix=/usr/local --default-library=static -Ddocs=false
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
