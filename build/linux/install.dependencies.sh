#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf git gperf libtool nasm pkg-config python python-pip python3-pip ragel

pip3 install cmake
pip3 install meson==0.55.3
pip3 install ninja==1.10.0.post2