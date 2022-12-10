#!/bin/bash
set -e

if [ -f "/bin/yum" ]; then
    if [ "$openmp" == "OpenMP" ]; then
        yum install -y libgomp
    fi

    if [ ! -f "/usr/bin/ld" ]; then
        yum install -y binutils
    fi

    if [ ! -f "/usr/bin/tar" ]; then
        yum install -y tar
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

