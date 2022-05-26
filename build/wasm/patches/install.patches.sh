#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd png
git apply $SCRIPT_PATH/png.patch

cd ../de265
find ./ -type f -exec sed -i 's/\-lstdc++//g' {} \;

cd ../heif
for f in examples/*.cc; do echo "" > $f; done

#exit 1
