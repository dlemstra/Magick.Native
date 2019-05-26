#!/bin/bash
set -e

verifyNative() {
    local quantum=$1
    local folder=$2

    local file=$folder/libMagick.NET-$quantum-x64.Native.dll.so

    if ldd $file 2>&1 | grep "not found"
    then
        exit 1
    else
        echo "Verified ldd status for $file"
    fi
    if ld $file 2>&1 | grep "undefined reference"
    then
        exit 1
    else
        echo "Verified ld status for $file"
    fi
}

verifyNative "Q8" $1