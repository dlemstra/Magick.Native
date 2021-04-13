#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew list --formula

brew install autoconf automake libtool nasm ossp-uuid pkg-config

# Uninstall already installed development libraries
brew uninstall --force php
brew uninstall --force gd
brew uninstall --force glib
brew uninstall --force gnupg
brew uninstall --force gnutls
brew uninstall --force guile
brew uninstall --force llvm
brew uninstall --force p11-kit
brew uninstall --force fontconfig
brew uninstall --force freetype
brew uninstall --force libffi
brew uninstall --force webp
brew uninstall --force libtiff
brew uninstall --force libjpeg
brew uninstall --force jpeg
brew uninstall --force sox
brew uninstall --force libpng
brew uninstall --force curl-openssl
brew uninstall --force libidn2
brew uninstall --force zstd
brew uninstall --force libzip
brew uninstall --ignore-dependencies xz

pip3 install meson==0.55.3
pip3 install ninja==1.10.0.post2
