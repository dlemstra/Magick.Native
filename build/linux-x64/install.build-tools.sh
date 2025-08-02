#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y autoconf autopoint binutils gcc g++ gettext git gperf libtool locales nasm pkg-config python python3-pip ragel texinfo unzip

locale-gen en_US.UTF-8

pip3 install --upgrade pip
pip3 install cmake==3.30.3
