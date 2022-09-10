#!/bin/bash
set -e

cd raqm
mkdir __build
cd __build
C_FLAGS=$FLAGS meson .. $MESON_OPTIONS --prefix=/usr/local --default-library=static -Ddocs=false
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
