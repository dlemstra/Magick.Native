#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y autoconf autopoint binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu g++-aarch64-linux-gnu gettext git gperf libtool nasm pkg-config python python3-pip ragel texinfo unzip

pip3 install --upgrade pip
pip3 install cmake==3.30.3
