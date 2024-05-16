#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew list --formula

brew install automake gnu-sed nasm ossp-uuid ragel

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

pip3 install setuptools
pip3 install meson==0.61.5
pip3 install ninja==1.10.0.post2
