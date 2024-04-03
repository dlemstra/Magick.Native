#!/bin/bash
set -e

cd bzlib
$MAKE install
rm -f /usr/local/bin/bzip2
