#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf autopoint binutils gcc g++ gettext git gperf libtool nasm pkg-config python python-pip python3-pip ragel texinfo

pip3 install --upgrade pip
pip3 install cmake==3.24.1.1
pip3 install meson==0.61.5
pip3 install ninja==1.10.2.3
