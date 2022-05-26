#!/bin/bash
set -e

config=$1
folder=$2
openmp=$3

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config/settings.sh

copyNative() {
    local quantum=$1
    local name=$quantum
    if [ "$openmp" == "OpenMP" ]; then
        name=${name}-OpenMP
    fi

    mkdir -p $folder/Release$name
    mkdir -p $folder/Release$name/x64
    cp $quantum/libMagick.Native-$name-x64.dll.so $folder/Release$name/x64/Magick.Native-$name-x64.dll.so
}

[ "$folder" != "" ] && [ ! -d "$folder" ] && mkdir "$folder"

for quantum in ${QUANTUMS[@]}; do
    copyNative $quantum
done
