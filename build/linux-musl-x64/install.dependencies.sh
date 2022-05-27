#!/bin/sh
set -e

apk update

apk add autoconf automake bash cmake file g++ gcc gettext-tiny git gperf libtool make meson musl-libintl nasm pkgconf python3 py3-lxml py3-pip ragel texinfo
