#!/bin/bash
set -e

config=$1
arch=$2
folder=$3
openmp=$4

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$arch/settings.sh

copyNative() {
    local quantum=$1
    local name=$quantum
    if [ "$openmp" == "OpenMP" ]; then
        name=${name}-OpenMP
    fi

    mkdir -p $folder/Release$name
    mkdir -p $folder/Release$name/$arch
    cp $quantum/libMagick.Native-$name-$arch.dll.$EXTENSION $folder/Release$name/$arch/Magick.Native-$name-$arch.dll.$EXTENSION
}

[ "$folder" != "" ] && [ ! -d "$folder" ] && mkdir "$folder"

for quantum in ${QUANTUMS[@]}; do
    copyNative $quantum
done
