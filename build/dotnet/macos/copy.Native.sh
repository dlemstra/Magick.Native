#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/libMagick.NET-$quantum-x64.Native.dll.dylib $target/Magick.NET-Q16-HDRI-x64.Native.dll.dylib
}

copyNative "Q8" $1