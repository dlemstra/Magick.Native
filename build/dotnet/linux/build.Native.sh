#!/bin/bash
set -e

cd /src/Native

echo "" > foo.cxx

mkdir Q8
cd Q8

cmake -DDEPTH=8 -DHDRI_ENABLE=no -DQUANTUM_NAME=Q8 -DLIBRARY_NAME=Magick.NET-Q8-x64.Native.dll -DPLATFORM=LINUX ..
make