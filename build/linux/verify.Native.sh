#!/bin/bash
set -e

folder=$1
openmp=$2

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/settings.sh

verifyNative() {
    local name=$1
    if [ "$openmp" == "OpenMP" ]; then
        name=${name}-OpenMP
    fi

    local file=${folder}/Release${name}/x64/Magick.Native-${name}-x64.dll.so

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

if [ -f "/bin/yum" ]; then
    yum install -y libgomp

    if [ ! -f "/usr/bin/ld" ]; then
        yum install -y binutils
    fi
else
    apt-get update -y
    apt-get install -y libgomp1

    if [ ! -f "/usr/bin/ld" ]; then
        apt-get install -y binutils
    fi
fi

for quantum in ${QUANTUMS[@]}; do
    verifyNative $quantum
done

