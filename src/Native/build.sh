#!/bin/bash
set -e

echo "" > foo.cxx

mkdir Q8
cd Q8

cmake -D DEPTH=8 -D QUANTUM=Q8 -D HDRI_ENABLE=no -DQUANTUM_NAME=Q8 -DPLATFORM=LINUX ..
make