#!/bin/bash
set -e

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

cp Q8/Magick.Native-Q8-x86.dll.js $1/magick.js
cp Q8/magick-Q8.d.ts $1/magick.d.ts
