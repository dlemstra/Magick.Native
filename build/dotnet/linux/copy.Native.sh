#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/libMagick.Native-$quantum-x64.dll.so $target/Magick.Native-$quantum-x64.dll.so
}

copyNative "Q8" $1