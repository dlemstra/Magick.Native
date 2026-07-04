#!/bin/sh
set -e

apk update -q

apk add -q autoconf automake bash curl file g++ gcc git libtool make pkgconf python3 py3-pip unzip
apk del -q ninja

pip3 install --break-system-packages --upgrade pip -q
pip3 install --break-system-packages cmake==3.30.3 -q
