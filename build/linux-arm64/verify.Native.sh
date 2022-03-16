#!/bin/bash
set -e

verifyNative() {
    local quantum=$1
    local folder=$2

    local file=${folder}/Release${quantum}/arm64/Magick.Native-${quantum}-arm64.dll.so

    if [ ! -f $file ]; then
        echo "Unable to find $file"
        exit 1
    fi

    exit_code=0
    output=$(ldd $file 2>&1) || exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo "Failed to execute ldd: $output"
        exit 1
    fi

    if echo "$output" | grep "not found"; then
        exit 1
    else
        echo "Verified ldd status for $file"
    fi

    output=$(ld $file 2>&1) || exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo "Failed to execute ld: $output"
        exit 1
    fi

    if echo "$output" | grep "undefined reference"; then
        exit 1
    else
        echo "Verified ld status for $file"
    fi
}

if [ ! -f "/usr/bin/ld" ]; then
    if type -P "apt-get"; then
        apt-get update -y
        apt-get install -y binutils
    else
        yum install -y binutils
    fi
fi

verifyNative "Q8" $1
verifyNative "Q16" $1
verifyNative "Q16-HDRI" $1
