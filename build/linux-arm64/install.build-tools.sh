#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -y

apt-get install -y autoconf autopoint binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu g++-aarch64-linux-gnu git libtool nasm pkg-config python python3-pip unzip

pip3 install --upgrade pip
pip3 install cmake==3.30.3
