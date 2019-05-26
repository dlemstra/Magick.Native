#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/libMagick.NET-$quantum-x64.Native.dll.so $target
}

copyNative "Q8" $1