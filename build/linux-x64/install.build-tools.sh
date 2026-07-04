#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

apt-get update -qq

apt-get install -y -qq autoconf autopoint binutils curl gcc g++ git libtool locales pkg-config python python3-pip unzip

locale-gen en_US.UTF-8

pip3 install --upgrade pip -q
pip3 install cmake==3.30.3 -q
