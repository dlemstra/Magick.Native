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

brew uninstall --ignore-dependencies brotli
brew uninstall --ignore-dependencies xz
brew uninstall --ignore-dependencies zlib
brew uninstall --ignore-dependencies zstd

# Install build tools
brew install automake libtool gnu-sed nasm ossp-uuid ragel

pip3 install setuptools
pip3 install meson==1.5.1
pip3 install ninja==1.11.1.1
