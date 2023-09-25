#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y autoconf autopoint binutils gcc g++ gettext git gperf libtool locales nasm pkg-config python python3-pip ragel texinfo

locale-gen en_US.UTF-8

pip3 install --upgrade pip
pip3 install cmake==3.24.1.1
pip3 install meson==0.61.5
pip3 install ninja==1.10.2.3
