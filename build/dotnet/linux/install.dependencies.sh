#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf git gperf libtool nasm pkg-config python python-pip python3-pip

pip3 install cmake
pip3 install meson
pip3 install ninja