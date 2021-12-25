#!/bin/bash
set -e

apt-get update -y

apt-get install -y autogen autoconf gperf libtool pkg-config shtool

pip3 install meson
pip3 install ninja

emconfigure || true
