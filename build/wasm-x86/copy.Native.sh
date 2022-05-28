#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/magick-$quantum.js $target/magick.js
    cp $quantum/magick-$quantum.d.ts $target/magick.d.ts
}

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

copyNative "Q8" $1