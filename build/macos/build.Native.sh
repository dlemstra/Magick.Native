#!/bin/bash
set -e

export PLATFORM="MACOS"
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS=""
export NATIVE_OPTIONS=""
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

    $CMAKE_COMMAND -D DEPTH=$depth -D HDRI_ENABLE=$hdri_enable -D QUANTUM_NAME=$quantum_name -D LIBRARY_NAME=$library_name -D PLATFORM=$PLATFORM $NATIVE_OPTIONS $CMAKE_OPTIONS ..
    make

    cd ..
}

buildNative "Q8"
buildNative "Q16"
buildNative "Q16-HDRI"
