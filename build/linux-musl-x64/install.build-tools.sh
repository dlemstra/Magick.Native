#!/bin/sh
set -e

apk update

apk add autoconf automake bash curl file g++ gcc gettext-tiny git gperf libtool make musl-libintl nasm pkgconf python3 py3-lxml py3-pip ragel texinfo unzip
apk del ninja

pip3 install --upgrade pip
pip3 install cmake==3.30.3
pip3 install meson==1.5.1
pip3 install ninja==1.11.1.1

echo '#!/bin/bash' > /usr/local/bin/gtkdocize
chmod 755 /usr/local/bin/gtkdocize
