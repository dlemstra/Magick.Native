#!/bin/bash
set -e

folder=$1
config=$2
architecture=$3
openmp=$4

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$architecture/settings.sh

copyNative() {
    local quantum=$1
    local name=$quantum
    if [ "$openmp" == "OpenMP" ]; then
        name=${name}-OpenMP
    fi

    mkdir -p $folder/Release$name
    mkdir -p $folder/Release$name/$architecture
    cp $quantum/libMagick.Native-$name-$architecture.dll.$EXTENSION $folder/Release$name/$architecture/Magick.Native-$name-$architecture.dll.$EXTENSION
}

[ "$folder" != "" ] && [ ! -d "$folder" ] && mkdir "$folder"

for quantum in ${QUANTUMS[@]}; do
    copyNative $quantum
done
