#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew list --formula

brew install autoconf automake libtool nasm ossp-uuid pkg-config ragel

# Uninstall already installed development libraries
brew uninstall --force composer
brew uninstall --force php
brew uninstall --force gd
brew uninstall --force r
brew uninstall --force imagemagick
brew uninstall --force cairo
brew uninstall --force libheif
brew uninstall --force x265
brew uninstall --force liblqr
brew uninstall --force shared-mime-info
brew uninstall --force glib
brew uninstall --force gnupg
brew uninstall --force gnutls
brew uninstall --force guile
brew uninstall --force llvm
brew uninstall --force p11-kit
brew uninstall --force libxft
brew uninstall --force ghostscript
brew uninstall --force fontconfig
brew uninstall --force freetype
brew uninstall --force libffi
brew uninstall --force libavif
brew uninstall --force aom
brew uninstall --force jpeg-xl
brew uninstall --force webp
brew uninstall --force libraw
brew uninstall --force openjpeg
brew uninstall --force little-cms2
brew uninstall --force libtiff
brew uninstall --force jasper
brew uninstall --force libjpeg
brew uninstall --force jpeg
brew uninstall --force sox
brew uninstall --force libpng
brew uninstall --force curl-openssl
brew uninstall --force libzip
brew uninstall --force httpd
brew uninstall --ignore-dependencies brotli
brew uninstall --ignore-dependencies libidn2
brew uninstall --ignore-dependencies xz
brew uninstall --ignore-dependencies zstd

pip3 install meson==0.55.3
pip3 install ninja==1.10.0.post2
