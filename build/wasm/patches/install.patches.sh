#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd freetype
git apply $SCRIPT_PATH/freetype-freetype.mk.patch
git apply $SCRIPT_PATH/freetype-unix-cc.in.patch

cd ../png
git apply $SCRIPT_PATH/png.patch

cd ../libde265
find ./ -type f -exec sed -i 's/\-lstdc++//g' {} \;

cd ../libheif
for f in examples/*.cc; do echo "" > $f; done

#exit 1