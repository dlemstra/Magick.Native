#!/bin/sh
set -e

apk update

apk add autoconf automake bash curl file g++ gcc git libtool make pkgconf python3 py3-pip unzip
apk del ninja

pip3 install --break-system-packages --upgrade pip
pip3 install --break-system-packages cmake==3.30.3
