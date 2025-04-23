#!/bin/bash
set -e

cd pixman
mkdir __build
cd __build
CFLAGS=$FLAGS meson setup .. $MESON_OPTIONS --buildtype=$MESON_BUILD_TYPE --prefix=/usr/local --default-library=static -Dtests=disabled -Ddemos=disabled
ninja install
