#!/bin/bash
set -e

target=$1
openmp=$2

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/settings.sh

copyNative() {
    local quantum=$1
    local name=$quantum
    if [ "$openmp" == "OpenMP" ]; then
        name=${name}-OpenMP
    fi

    mkdir -p $target/Release$name
    mkdir -p $target/Release$name/x64
    cp $quantum/libMagick.Native-$name-x64.dll.so $target/Release$name/x64/Magick.Native-$name-x64.dll.so
}

[ "$target" != "" ] && [ ! -d "$target" ] && mkdir "$target"

for quantum in ${QUANTUMS[@]}; do
    copyNative $quantum
done
