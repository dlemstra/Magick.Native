#!/bin/bash
set -e

apt-get update -qq

apt-get install -y -qq autogen autoconf libtool locales pkg-config shtool > /dev/null

locale-gen en_US.UTF-8

pip3 install --break-system-packages cmake==3.30.3 -q

emconfigure || true
