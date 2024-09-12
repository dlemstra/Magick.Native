#!/bin/bash
set -e

apt-get update -y

apt-get install -y autogen autoconf gperf libtool locales pkg-config shtool

locale-gen en_US.UTF-8

pip3 install --upgrade pip
pip3 install cmake==3.30.3
pip3 install meson==1.5.1
pip3 install ninja==1.11.1.1

emconfigure || true
