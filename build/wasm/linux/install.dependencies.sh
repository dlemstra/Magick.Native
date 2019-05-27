#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf libtool shtool autogen pkg-config gperf

emconfigure