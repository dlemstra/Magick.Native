#!/bin/sh
set -e

apk update

apk add autoconf automake bash file g++ gcc gettext-tiny git gperf libtool make musl-libintl nasm pkgconf python3 py3-lxml py3-pip ragel texinfo
apk del ninja

pip3 install --upgrade pip
pip3 install cmake==3.24.1.1
pip3 install meson==0.61.5
pip3 install ninja==1.10.2.3
