#!/bin/bash
set -e

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

cp Q8/magick.mjs $1/magick.mjs
cp Q8/magick.wasm $1/magick.wasm
cp Q8/magick.d.ts $1/magick.d.ts
