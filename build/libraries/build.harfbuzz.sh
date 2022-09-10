#!/bin/bash
set -e

cd harfbuzz
mkdir __build
cd __build
CFLAGS=$FLAGS meson .. $MESON_OPTIONS --prefix=/usr/local --default-library=static -Ddocs=disabled -Dtests=disabled -Dcairo=disabled
ninja install
