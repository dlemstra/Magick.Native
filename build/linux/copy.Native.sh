#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    mkdir -p $target/Release$quantum
    mkdir -p $target/Release$quantum/x64
    cp $quantum/libMagick.Native-$quantum-x64.dll.so $target/Release$quantum/x64/Magick.Native-$quantum-x64.dll.so
}

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

copyNative "Q8" $1
copyNative "Q16" $1
copyNative "Q16-HDRI" $1
