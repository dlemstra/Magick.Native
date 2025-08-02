#!/bin/sh
set -e

apk update

apk add autoconf automake bash curl file g++ gcc git libtool make pkgconf python3 py3-pip unzip
apk del ninja

pip3 install --upgrade pip
pip3 install cmake==3.30.3

echo '#!/bin/bash' > /usr/local/bin/gtkdocize
chmod 755 /usr/local/bin/gtkdocize
