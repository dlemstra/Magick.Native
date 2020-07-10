#!/bin/bash
set -e

clone() {
  local repo=$1
  local dir=$2
  local root="https://github.com/ImageMagick"

  echo ''
  echo "Cloning $1"

  if [ ! -d "$dir" ]; then
    git clone $root/$repo.git $dir
    if [ $? != 0 ]; then echo "Error during checkout"; exit; fi
  fi
  cd $dir
  git pull origin master
  cd ..
}

#clone and check out a specific commit
clone_commit()
{
  local repo=$1
  local commit=$2
  local dir=$3
  if [ -z $dir ]; then dir=$repo; fi

  clone $repo $dir

  cd $dir
  git checkout $commit
  cd ..
}

#clone and check out a specific date
clone_date()
{
  local repo=$1
  local date=$2
  local dir=$3
  if [ -z $dir ]; then dir=$repo; fi

  clone $repo $dir

  cd $dir
  git checkout `git rev-list -n 1 --before="$date" origin/master`
  cd ..
}

commit=$(<ImageMagick.commit)

if [ ! -d "libraries" ]; then
  mkdir libraries
fi

cd libraries

clone_commit 'ImageMagick' $commit

# get a commit date from the current ImageMagick checkout
cd ImageMagick
declare -r commitDate=`git log -1 --format=%ci`
echo "Set latest commit date as $commitDate" 
cd ..

clone_date 'aom' "$commitDate"
clone_commit 'croco' '883f6757406e480302484a4edccb1b0232216f48'
clone_date 'cairo' "$commitDate"
clone_date 'exr' "$commitDate"
clone_date 'freetype' "$commitDate"
clone_date 'fribidi' "$commitDate"
clone_date 'harfbuzz' "$commitDate"
clone_date 'jpeg-turbo' "$commitDate" 'jpeg'
clone_commit 'glib' 'ae68ba39d57922c3e43ec34a3a896587b976400b'
clone_date 'lcms' "$commitDate"
clone_date 'libde265' "$commitDate"
clone_date 'libheif' "$commitDate"
clone_date 'libraw' "$commitDate"
clone_commit 'librsvg' '10d10cbc7994afc8bce618b64dda0d1b64de7308'
clone_date 'libxml' "$commitDate"
clone_date 'lqr' "$commitDate"
clone_date 'openjpeg' "$commitDate"
clone_commit 'pixman' '30506a90b56527e0d28ae39cafb7237d7f2ab240'
clone_date 'pango' "$commitDate"
clone_date 'png' "$commitDate"
clone_date 'tiff' "$commitDate"
clone_date 'webp' "$commitDate"
clone_date 'zlib' "$commitDate"

if [ "$1" == "macos" ] || [ "$1" == "linux" ]; then
  # Clone fontconfig
  if [ ! -d fontconfig ]; then
    git clone https://gitlab.freedesktop.org/fontconfig/fontconfig fontconfig
  fi
  cd fontconfig
  git reset --hard
  git fetch
  git checkout 2.12.6
  cd ..

  # Clone ffi
  if [ ! -d ffi ]; then
    git clone https://github.com/libffi/libffi.git ffi
  fi
  cd ffi
  git reset --hard
  git fetch
  git checkout v3.3
  cd ..

  exit
fi

clone_date 'ffi' "$commitDate"
clone_date 'flif' "$commitDate"
clone_date 'jp2' "$commitDate"
clone_date 'VisualMagick' "$commitDate"

rm -rf VisualMagick/bzlib
rm -rf VisualMagick/dcraw
rm -rf VisualMagick/demos
rm -rf VisualMagick/fuzz
rm -rf VisualMagick/ImageMagickObject
rm -rf VisualMagick/IMDisplay
rm -rf VisualMagick/iptcutil
rm -rf VisualMagick/liblzma
rm -rf VisualMagick/Magick++
rm -rf VisualMagick/NtMagick
rm -rf VisualMagick/tests
rm -rf VisualMagick/utilities
