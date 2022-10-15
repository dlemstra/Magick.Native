#!/bin/bash
set -e

folder=$1
config=$2
arch=$3

moveFromLib64() {
    mv /usr/local/lib64/pkgconfig/*.pc /usr/local/lib/pkgconfig
    mv /usr/local/lib64/*.a /usr/local/lib
}

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$arch/settings.sh
. $SCRIPT_PATH/../$config-$arch/libraries.sh $folder
