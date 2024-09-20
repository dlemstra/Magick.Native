#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew list --formula

# Uninstall already installed development libraries

brew uninstall imagemagick

brew uninstall composer
brew uninstall php
brew uninstall ant
brew uninstall gradle
brew uninstall maven
brew uninstall kotlin
brew uninstall selenium-server
brew uninstall sbt
brew uninstall r
brew uninstall colima

brew uninstall libxft
brew uninstall sox
brew uninstall libxext

brew uninstall jpeg-xl
brew uninstall libpng

brew uninstall --ignore-dependencies brotli
brew uninstall --ignore-dependencies xz
brew uninstall --ignore-dependencies zlib
brew uninstall --ignore-dependencies zstd

packages=(
    "aom"
    "brotli"
    "cairo"
    "fontconfig"
    "freetype"
    "glib"
    "harfbuzz"
    "highway"
    "imagemagick"
    "jasper"
    "jbig2dec"
    "jpeg-turbo"
    "libheif"
    "liblqr"
    "libpng"
    "libraw"
    "libtiff"
    "libzip"
    "little-cms2"
    "openjpeg"
    "pixman"
    "webp"
    "x265"
    "xz"
    "zlib"
    "zstd"
)

# Check if all packages are uninstalled
for package in "${packages[@]}"; do
    if brew list --formula | grep -q "^${package}\$"; then
        echo "${package} should not be installed"
        exit 1
    fi
done

# Install build tools
brew install automake libtool gnu-sed nasm ossp-uuid ragel

pip3 install setuptools
pip3 install meson==1.5.1
pip3 install ninja==1.11.1.1
