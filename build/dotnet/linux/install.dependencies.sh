#!/bin/bash
set -e

apt-get update -y

apt-get install -y autoconf git gperf libtool nasm pkg-config python python-pip

pip install cmake