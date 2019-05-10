#!/bin/bash
set -e

cd /src/Native

echo "" > foo.cxx

mkdir Q8
cd Q8

emconfigure cmake .. -DDEPTH=8 -DHDRI_ENABLE=no -DQUANTUM_NAME=Q8 -DLIBRARY_NAME=magick-Q8 -DPLATFORM=WASM -DCMAKE_CXX_COMPILER=em++ -DCMAKE_C_COMPILER=emcc
make