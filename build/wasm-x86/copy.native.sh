#!/bin/bash
set -e

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

sed 's#magick.wasm",import.meta.url#data:text/plain;base64,"#' Q8/magick.js > $1/magick.js
cp Q8/magick.constants.ts $1/magick.constants.ts
cp Q8/magick.d.ts $1/magick.d.ts
cp Q8/magick.wasm $1/magick.wasm
