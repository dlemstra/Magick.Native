#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew list --formula

brew install automake gnu-sed nasm ossp-uuid ragel

# Uninstall already installed development libraries
brew uninstall imagemagick

brew uninstall composer
brew uninstall php
brew uninstall gd
brew uninstall ghostscript
brew uninstall ant
brew uninstall gradle
brew uninstall maven
brew uninstall kotlin
brew uninstall selenium-server
brew uninstall sbt
brew uninstall openjdk
brew uninstall r
brew uninstall colima
brew uninstall lima
brew uninstall qemu

brew uninstall harfbuzz
brew uninstall cairo
brew uninstall libraw
brew uninstall jasper
brew uninstall libheif
brew uninstall libde265
brew uninstall x265
brew uninstall liblqr
brew uninstall libavif
brew uninstall aom
brew uninstall jpeg-xl
brew uninstall highway
brew uninstall webp
brew uninstall openjpeg
brew uninstall little-cms2
brew uninstall libtiff
brew uninstall jpeg-turbo
brew uninstall libzip
brew uninstall pixman

brew uninstall libxft
brew uninstall sox
brew uninstall libxext
brew uninstall libxrender
brew uninstall libx11
brew uninstall libslirp
brew uninstall shared-mime-info

brew uninstall fontconfig
brew uninstall freetype
brew uninstall libpng
brew uninstall glib

brew uninstall --ignore-dependencies brotli
brew uninstall --ignore-dependencies xz
brew uninstall --ignore-dependencies zlib
brew uninstall --ignore-dependencies zstd

pip3 install setuptools
pip3 install meson==0.61.5
pip3 install ninja==1.10.0.post2
