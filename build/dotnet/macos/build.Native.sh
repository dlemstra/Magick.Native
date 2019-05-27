#!/bin/bash
set -e

export PLATFORM="MACOS"

echo "" > foo.cxx

buildMagickNET() {
    local quantum=$1

    # Set ImageMagick variables
    local quantum_name=$quantum
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

    cmake -D DEPTH=$depth -D HDRI_ENABLE=$hdri_enable -DQUANTUM_NAME=$quantum_name -DLIBRARY_NAME=Magick.NET-$quantum-x64.Native.dll -DPLATFORM=$PLATFORM ..
    make

    cd ..
}

buildMagickNET "Q8"