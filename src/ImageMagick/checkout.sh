#!/bin/bash
set -e

clone() {
    local repo=$1
    local root=$2

    echo ''
    echo "Cloning $repo"

    if [ -z "$root" ]; then
        root="https://github.com/ImageMagick"
    fi

    if [ ! -d "$repo" ]; then
        git clone $root/$repo.git $repo
        if [ $? != 0 ]; then echo "Error during checkout"; exit; fi
    fi
    cd $repo
    git reset --hard
    git pull origin main
    cd ..
}

clone_commit()
{
    local repo=$1
    local commit=$2
    local root=$3

    clone $repo $root

    cd $repo
    git checkout $commit
    cd ..
}

clone_date()
{
    local repo=$1
    local date=$2
    local root=$3

    clone $repo $root

    cd $repo
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
    echo -e "" >> $notice
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
    local date=$1
    local output=$2

    if [ -z "$output" ]; then
        output=../output
    fi

    mkdir -p $output
    local notice=$output/NOTICE

    echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" > $notice
    echo -e "[ Magick.Native ] copyright:\n" >> $notice
    add_copyright '../../Magick.Native/Copyright.txt' $notice

    echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice
    local version=$(get_imagemagick_version)
    date="$(echo $date | sed 's/ .*//')"
    echo -e "[ ImageMagick $version ($date) ] copyright:\n" >> $notice
    add_copyright 'ImageMagick/LICENSE' $notice

    for dir in *; do
        local config=VisualMagick/$dir/Config.txt
        if [ -f "$config" ]; then
            local copyright="$(sed -n '/\[LICENSE\]/{n;p;}' $config | tr -d '[:space:]' | sed -e 's/\.\.\\//g' | sed -e 's/\\/\//g')"
            local fileNames=$(echo $copyright | tr ";" "\n")

            echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice

            for fileName in $fileNames
            do
                fileName="$dir/$fileName"
                if [ ! -f "$fileName" ]; then
                    echo -e "Unable to find '$fileName'"
                else
                    local folder=$(dirname $fileName)
                    local versionFile="$folder/ImageMagick/ImageMagick.version.h"
                    if [ ! -f "$versionFile" ]; then
                        folder=$(dirname $folder)
                        versionFile="$folder/ImageMagick/ImageMagick.version.h"
                        if [ ! -f "$versionFile" ]; then
                            echo -e "Unable to find '$versionFile'"
                            continue
                        fi
                    fi

                    version="$(tail -n +2 $versionFile | awk -F " " '{print $3 " " $4}' | sed -e 's/"//g')"
                    echo -e "[ $(basename $folder) $version ] copyright:\n" >> $notice

                    add_copyright $fileName $notice
                fi
            done
        fi
    done

    echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice
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

clone_commit 'aom' "ae80c573b5f13b2cdd3f64dd64c405d809417d85"
clone_date 'brotli' "$commitDate"
clone_date 'de265' "$commitDate"
clone_date 'exr' "$commitDate"
clone_date 'freetype' "$commitDate"
clone_date 'ffi' "$commitDate"
clone_date 'glib' "$commitDate"
clone_date 'heif' "$commitDate"
clone_commit 'highway' "73a6d88822f65ff96f785829f9d04a322994f9a6"
clone_date 'jpeg-turbo' "$commitDate"
clone_date 'jpeg-xl' "$commitDate"
clone_date 'lcms' "$commitDate"
clone_date 'lqr' "$commitDate"
clone_date 'openjpeg' "$commitDate"
clone_date 'png' "$commitDate"
clone_date 'raw' "$commitDate"
clone_date 'tiff' "$commitDate"
clone_commit 'VisualMagick' "34663bbfd168314d17134710f98aeab4328093f1"
clone_date 'webp' "$commitDate"
clone_date 'xml' "$commitDate"
clone_date 'zlib' "$commitDate"

if [ "$1" == "wasm" ]; then
    create_notice "$commitDate" $2
    exit
fi

clone_date 'bzlib' "$commitDate"
clone_date 'cairo' "$commitDate"
clone_date 'croco' "$commitDate"
clone_date 'fribidi' "$commitDate"
clone_date 'harfbuzz' "$commitDate"
clone_date 'lzma' "$commitDate"
clone_date 'pango' "$commitDate"
clone_date 'raqm' "$commitDate"
clone_date 'pixman' "$commitDate"
clone_date 'rsvg' "$commitDate"
clone_date 'zip' "$commitDate"

if [ "$1" == "macos" ] || [ "$1" == "linux" ] || [ "$1" == "linux-musl" ]; then
    clone_commit 'fontconfig' "ca7dc14b14016d103ce595152b7c009c3d9c7d06" "https://github.com/dlemstra"

    mkdir -p VisualMagick/fontconfig
    echo -e "[LICENSE]\nfontconfig/COPYING" > VisualMagick/fontconfig/Config.txt

    create_notice "$commitDate" $2
    exit
fi

clone_date 'jasper' "$commitDate"

create_notice "$commitDate" $2

rm -rf VisualMagick/dcraw
rm -rf VisualMagick/demos
rm -rf VisualMagick/fftw
rm -rf VisualMagick/flif
rm -rf VisualMagick/fuzz
rm -rf VisualMagick/ImageMagickObject
rm -rf VisualMagick/IMDisplay
rm -rf VisualMagick/iptcutil
rm -rf VisualMagick/jbig
rm -rf VisualMagick/Magick++
rm -rf VisualMagick/NtMagick
rm -rf VisualMagick/tests
rm -rf VisualMagick/utilities
