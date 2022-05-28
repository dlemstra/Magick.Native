#!/bin/bash
set -e

config=$1
arch=$2
folder=$3
openmp=$4

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$arch/settings.sh


verifyNative() {
    local name=$1
    if [ "$openmp" == "OpenMP" ]; then
        name=${name}-OpenMP
    fi

    local file=${folder}/Release${name}/$arch/Magick.Native-${name}-$arch.dll.$EXTENSION

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

    if [ "$openmp" == "OpenMP" ]; then
        if [[ "$output" != *"libgomp.so"* ]]; then
            echo "Libgomp should be linked in $file"
        fi
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
    if [ "$openmp" == "OpenMP" ]; then
        yum install -y libgomp
    fi

    if [ ! -f "/usr/bin/ld" ]; then
        yum install -y binutils
    fi
elif [ -f "/sbin/apk" ]; then
    apk update
    if [ "$openmp" == "OpenMP" ]; then
        apk add libgomp
    fi

    if [ ! -f "/usr/bin/ld" ]; then
        apk add binutils
    fi
else
    apt-get update -y
    if [ "$openmp" == "OpenMP" ]; then
        apt-get install -y libgomp1
    fi

    if [ ! -f "/usr/bin/ld" ]; then
        apt-get install -y binutils
    fi
fi

for quantum in ${QUANTUMS[@]}; do
    verifyNative $quantum
done

