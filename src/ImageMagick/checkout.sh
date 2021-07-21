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
  git pull origin main
  cd ..
}

clone_commit()
{
  local repo=$1
  local commit=$2
  local dir=$repo

  clone $repo $dir

  cd $dir
  git checkout $commit
  cd ..
}

clone_date()
{
  local repo=$1
  local date=$2
  local dir=$repo

  clone $repo $dir

  cd $dir
  git checkout `git rev-list -n 1 --before="$date" origin/main`
  cd ..
}

get_charset()
{
  local file=$1

  local charset="$(file -bi $file | awk -F "=" '{print $2}')"
  if [ -z "$charset" ]; then
    charset="$(file -I $file | awk -F "=" '{print $2}')"
  fi
  echo $charset
}

add_copyright()
{
  local copyrightFile=$1
  local notice=$2

  local charset="$(get_charset $copyrightFile)"

  echo -e "Adding notice from '$copyrightFile' ($charset)"
  iconv -f $charset -t utf-8 $copyrightFile | sed -e 's/\xef\xbb\xbf//' | tr -d '\r' >> $notice
}

get_imagemagick_version()
{
  local charset="$(get_charset "ImageMagick/m4/version.m4")"
  local version="$(iconv -f $charset -t utf-8 ImageMagick/m4/version.m4 | sed -e 's/\xef\xbb\xbf//' | sed -e '/[rol]_version/! s/.*//' | sed -e 's/m4//' | sed -e 's/patchlevel_version/-/' | sed -e 's/minor_version/./' | sed -e 's/micro_version/./' | sed -e 's/[^0-9\.-]*//g' | tr -d '\r' | tr -d '\n')"

  local tag="$(cd ImageMagick && git describe --exact-match --tags HEAD && cd ..)"
  if [ -z "$tag" ]; then
    version="$version beta"
  fi
  echo $version
}

create_notice()
{
  local output=$1

  if [ -z "$output" ]; then
    output=../output
  fi

  mkdir -p $output
  local notice=$output/Notice.txt

  echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" > $notice
  echo -e "[ Magick.Native ] copyright:\n" >> $notice
  add_copyright '../../Magick.Native/Copyright.txt' $notice

  echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice
  version=$(get_imagemagick_version)
  echo -e "[ ImageMagick $version ] copyright:\n" >> $notice
  add_copyright 'ImageMagick/LICENSE' $notice

  for dir in *; do
    if [ -d "$dir" ]; then
      local config=VisualMagick/$dir/Config.txt
      if [ -f "$config" ]; then
        echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice
        version="$(tail -n +2 $dir/ImageMagick/ImageMagick.version.h | awk -F " " '{print $3 " " $4}' | sed -e 's/"//g')"
        echo -e "[ $dir $version ] copyright:\n" >> $notice
        copyright="$(sed -n '/\[LICENSE\]/{n;p;}' $config | tr -d '[:space:]' | sed -e 's/\.\.\\//g' | sed -e 's/\\/\//g')"
        if [ -f "$copyright" ]; then
          add_copyright $copyright $notice
        else
          echo -e "Unable to find '$copyright'"
        fi
      fi
    fi
  done

  echo -e "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice
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

clone_date 'freetype' "$commitDate"
clone_date 'jpeg-turbo' "$commitDate"
clone_date 'lcms' "$commitDate"
clone_date 'libde265' "$commitDate"
clone_date 'libheif' "$commitDate"
clone_date 'libraw' "$commitDate"
clone_date 'libxml' "$commitDate"
clone_date 'openjpeg' "$commitDate"
clone_date 'png' "$commitDate"
clone_date 'tiff' "$commitDate"
clone_date 'VisualMagick' "$commitDate"
clone_date 'webp' "$commitDate"
clone_date 'zlib' "$commitDate"

if [ "$1" == "wasm" ]; then
  create_notice $2
  exit
fi

clone_date 'aom' "$commitDate"
clone_date 'cairo' "$commitDate"
clone_date 'croco' "$commitDate"
clone_date 'exr' "$commitDate"
clone_date 'ffi' "$commitDate"
clone_date 'fribidi' "$commitDate"
clone_date 'glib' "$commitDate"
clone_date 'harfbuzz' "$commitDate"
clone_date 'lqr' "$commitDate"
clone_date 'pango' "$commitDate"
clone_date 'raqm' "$commitDate"
clone_date 'pixman' "$commitDate"
clone_date 'librsvg' "$commitDate"

if [ "$1" == "macos" ] || [ "$1" == "linux" ]; then
  if [ ! -d fontconfig ]; then
    git clone https://gitlab.freedesktop.org/fontconfig/fontconfig fontconfig
  fi
  cd fontconfig
  git reset --hard
  git fetch
  git checkout 2.12.6
  cd ..

  mkdir -p VisualMagick/fontconfig
  echo -e "[LICENSE]\nfontconfig/COPYING" > VisualMagick/fontconfig/Config.txt
fi

if [ "$1" == "macos" ]; then
  create_notice $2
  exit
fi

clone_date 'brotli' "$commitDate"
clone_date 'bzlib' "$commitDate"
clone_date 'highway' "$commitDate"
clone_date 'jpeg-xl' "$commitDate"
clone_date 'liblzma' "$commitDate"
clone_date 'libzip' "$commitDate"

if [ "$1" == "linux" ]; then
  create_notice $2
  exit
fi

clone_date 'flif' "$commitDate"
clone_date 'jp2' "$commitDate"

create_notice $2

rm -rf VisualMagick/dcraw
rm -rf VisualMagick/demos
rm -rf VisualMagick/fuzz
rm -rf VisualMagick/ImageMagickObject
rm -rf VisualMagick/IMDisplay
rm -rf VisualMagick/iptcutil
rm -rf VisualMagick/jbig
rm -rf VisualMagick/Magick++
rm -rf VisualMagick/NtMagick
rm -rf VisualMagick/tests
rm -rf VisualMagick/utilities
