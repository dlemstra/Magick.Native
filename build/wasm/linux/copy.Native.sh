#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/magick-$quantum.js $target/magick-$quantum.js
    cp $quantum/magick-$quantum.d.ts $target/magick-$quantum.d.ts
}

copyNative "Q8" $1