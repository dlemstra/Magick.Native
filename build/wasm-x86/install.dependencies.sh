#!/bin/bash
set -e

apt-get update -y

apt-get install -y autogen autoconf gperf libtool pkg-config shtool

pip3 install --upgrade pip
pip3 install cmake==3.24.1.1
pip3 install meson==0.64.0
pip3 install ninja==1.10.2.3

emconfigure || true
