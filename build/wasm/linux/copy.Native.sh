#!/bin/bash
set -e

copyNative() {
    local quantum=$1
    local target=$2

    cp $quantum/magick-$quantum.js $target/magick-$quantum.js
}

copyNative "Q8" $1