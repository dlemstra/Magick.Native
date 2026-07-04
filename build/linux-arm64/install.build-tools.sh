#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -qq

apt-get install -y -qq autoconf autopoint binutils-aarch64-linux-gnu curl gcc-aarch64-linux-gnu g++-aarch64-linux-gnu git libtool nasm pkg-config python python3-pip unzip

pip3 install --upgrade pip -q
pip3 install cmake==3.30.3 -q
