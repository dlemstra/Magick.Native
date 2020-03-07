#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew list

brew install autoconf automake libiconv libtool nasm ossp-uuid pkg-config

# Uninstall already installed development libraries
brew uninstall --force php
brew uninstall --force freetype
brew uninstall --force webp
brew uninstall --force libtiff
brew uninstall --force jpeg
brew uninstall --force libpng
brew uninstall --force zstd
brew uninstall --ignore-dependencies xz