#!/bin/bash
set -e

export HOMEBREW_NO_AUTO_UPDATE=1

brew install autoconf automake libiconv libtool nasm ossp-uuid pkg-config

# Uninstall already installed development libraries
brew uninstall --force libpng
brew uninstall --ignore-dependencies xz