#!/bin/bash
set -e

apt-get update -y

apt-get install -y autogen autoconf libtool locales pkg-config shtool

locale-gen en_US.UTF-8

pip3 install --upgrade pip
pip3 install cmake==3.30.3

emconfigure || true
