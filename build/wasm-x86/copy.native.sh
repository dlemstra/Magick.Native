#!/bin/bash
set -e

[ "$1" != "" ] && [ ! -d "$1" ] && mkdir "$1"

sed 's#magick.wasm",import.meta.url#data:text/plain;base64,"#' Q8/magick.js > $1/magick.js
cp Q8/magick.constants.ts $1/magick.constants.ts
cp Q8/magick.d.ts $1/magick.d.ts
cp Q8/magick.wasm $1/magick.wasm

version_file="../ImageMagick/m4/version.m4"
major=$(grep "magick_major_version" "$version_file" | sed 's/.*\[\([^]]*\)\])/\1/')
minor=$(grep "magick_minor_version" "$version_file" | sed 's/.*\[\([^]]*\)\])/\1/')
micro=$(grep "magick_micro_version" "$version_file" | sed 's/.*\[\([^]]*\)\])/\1/')
patchlevel=$(grep "magick_patchlevel_version" "$version_file" | sed 's/.*\[\([^]]*\)\])/\1/')
is_beta=$(grep "magick_is_beta" "$version_file" | sed 's/.*\[\([^]]*\)\])/\1/')
release_date=$(git -C ../ImageMagick log -1 --format=%cd --date=format:%Y-%m-%d)

echo -n "[ ImageMagick $major.$minor.$micro-$patchlevel" > $1/NOTICE
if [ "$is_beta" != "n" ]; then
  echo -n " (Beta)" >> $1/NOTICE
fi
echo " ($imagemagick_release_date) ]" >> $1/NOTICE
echo >> NOTICE
(cat ../ImageMagick/LICENSE;echo) >> NOTICE

for file in /tmp/dependencies/license/*; do
  (cat $file;echo) >> NOTICE
done
