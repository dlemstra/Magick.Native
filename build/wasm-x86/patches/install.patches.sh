#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd de265
find ./ -type f -exec sed -i 's/\-lstdc++//g' {} \;

cd ../heif
for f in examples/*.cc; do echo "" > $f; done
