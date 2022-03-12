#!/bin/sh
set -e

export PLATFORM="LINUX"
export NATIVE_OPTIONS=""

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/settings.sh
getLibraryName() {
    local quantum=$1
    echo Magick.Native-$quantum-x64.dll
}

echo "" > foo.cxx

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

    mkdir $quantum
    cd $quantum

    $CMAKE_COMMAND $CMAKE_OPTIONS $NATIVE_OPTIONS -DDEPTH=$depth -DHDRI_ENABLE=$hdri_enable -DQUANTUM_NAME=$quantum_name -DLIBRARY_NAME=$library_name -DPLATFORM=$PLATFORM ..
    make

    cd ..
}

buildNative "Q8"
buildNative "Q16"
buildNative "Q16-HDRI"
