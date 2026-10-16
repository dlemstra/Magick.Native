#!/bin/sh
set -e

apk update -q

apk add -q autoconf automake bash binutils-aarch64 clang18 curl file git libtool make pkgconf python3 py3-pip unzip
apk del -q ninja

pip3 install --break-system-packages --upgrade pip -q
pip3 install --break-system-packages cmake==3.30.3 -q

apk add --root /usr/aarch64-alpine-linux-musl --arch aarch64 --initdb --no-scripts --no-cache \
  --keys-dir /usr/share/apk/keys/aarch64 --repositories-file /etc/apk/repositories \
  g++ linux-headers musl-dev openmp-dev
