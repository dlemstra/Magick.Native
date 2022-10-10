#!/bin/bash
set -e

config=$1
arch=$2
openmp=$3

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$arch/settings.sh

getLibraryName() {
    local quantum=$1
    if [ "$openmp" == "OpenMP" ]; then
        echo Magick.Native-$quantum-OpenMP-$arch.dll
    else
        echo Magick.Native-$quantum-$arch.dll
    fi
}

buildNative() {
    local quantum=$1

    local quantum_name=$quantum
    local library_name=$(getLibraryName $quantum)
    local hdri_enable=0
    local depth=8
    if [ "$quantum" == "Q16" ]; then
        depth=16
    elif [ "$quantum" == "Q16-HDRI" ]; then
        quantum_name=Q16HDRI
        depth=16
        hdri_enable=1
    fi

    if [ -d $quantum ]; then
        rm -Rf $quantum
    fi
    mkdir $quantum
    cd $quantum

    $CMAKE_COMMAND $CMAKE_OPTIONS -DDEPTH=$depth -DHDRI_ENABLE=$hdri_enable -DQUANTUM_NAME=$quantum_name -DLIBRARY_NAME=$library_name -DPLATFORM=$PLATFORM ..
    make

    cd ..
}

for quantum in ${QUANTUMS[@]}; do
    buildNative $quantum
done
