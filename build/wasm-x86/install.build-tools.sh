#!/bin/bash
set -e

apt-get update -qq

apt-get install -y -qq autogen autoconf libtool locales pkg-config shtool

locale-gen en_US.UTF-8

pip3 install --upgrade pip -q
pip3 install cmake==3.30.3 -q

emconfigure || true
