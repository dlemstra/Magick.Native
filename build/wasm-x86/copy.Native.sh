#!/bin/bash
set -e

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

cp Q8/Magick.Native-Q8-x86.dll.js $1/magick.js
cp Q8/Magick.Native-Q8-x86.dll.wasm $1/magick.wasm
cp Q8/Magick.Native-Q8-x86.dll.d.ts $1/magick.d.ts

sed -i 's/Magick.Native-Q8-x86.dll/magick/g' $1/magick.js
