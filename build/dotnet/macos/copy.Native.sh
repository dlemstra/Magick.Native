#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/libMagick.Native-$quantum-x64.dll.dylib $target/Magick.Native-Q16-HDRI-x64.dll.dylib
}

copyNative "Q8" $1