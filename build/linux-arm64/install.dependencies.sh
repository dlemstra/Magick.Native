#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf autopoint binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu g++-aarch64-linux-gnu gettext git gperf libtool nasm pkg-config python python-pip python3-pip ragel texinfo

pip3 install cmake
pip3 install meson==0.55.3
pip3 install ninja==1.10.0.post2
