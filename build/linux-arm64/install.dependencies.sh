#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf autopoint gettext git gperf libtool nasm pkg-config python python-pip python3-pip ragel software-properties-common texinfo

add-apt-repository ppa:ubuntu-toolchain-r/test -y
apt-get update -y
apt-get install binutils-aarch64-linux-gnu gcc-7 gcc-aarch64-linux-gnu g++-7 g++-aarch64-linux-gnu -y
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7
update-alternatives --config gcc

pip3 install cmake
pip3 install meson==0.55.3
pip3 install ninja==1.10.0.post2
