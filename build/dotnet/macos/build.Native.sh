#!/bin/bash
set -e

export PLATFORM="MACOS"
export CMAKE_CONFIGURE=""
export CMAKE_OPTIONS=""
getLibraryName() {
    local quantum=$1
    echo Magick.NET-$quantum-x64.Native.dll
}

echo "" > foo.cxx

buildMagickNET() {
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

    $CMAKE_CONFIGURE -D DEPTH=$depth -D HDRI_ENABLE=$hdri_enable -DQUANTUM_NAME=$quantum_name -DLIBRARY_NAME=$library_name -DPLATFORM=$PLATFORM $CMAKE_OPTIONS ..
    make

    cd ..
}

buildMagickNET "Q8"