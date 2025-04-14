#!/bin/bash
set -e

function cloneImageMagickWindows()
{
    if [ ! -d "imagemagick-windows" ]; then
        git clone https://github.com/ImageMagick/ImageMagick-Windows imagemagick-windows
    else
        cd imagemagick-windows
        git reset --hard
        git pull origin main
        cd ..
    fi

    rm -rf imagemagick-windows/Projects/demos/.ImageMagick
    rm -rf imagemagick-windows/Projects/filters/.ImageMagick
    rm -rf imagemagick-windows/Projects/Magick++/.ImageMagick
    rm -rf imagemagick-windows/Projects/oss-fuzz/.ImageMagick
    rm -rf imagemagick-windows/Projects/utilities/.ImageMagick
}

function cloneRepositories()
{
    local platform=$1

    commit=$(<ImageMagick.commit)

    cd imagemagick-windows
    bash CloneRepositories.sh ImageMagick $commit
    cd ..

    if [ "$platform" == "wasm" ]; then
         rm -rf imagemagick-windows/Dependencies/bzlib/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/cairo/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/croco/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/fribidi/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/harfbuzz/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/lzma/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/openh264/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/pango/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/pixman/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/raqm/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/rsvg/.ImageMagick
         rm -rf imagemagick-windows/Dependencies/zip/.ImageMagick
    fi
}

function cloneFontconfig()
{
    local platform=$1

    if [ "$platform" == "macos" ] || [ "$platform" == "linux" ]; then
        cd imagemagick-windows/Dependencies
        if [ ! -d "fontconfig" ]; then
            git clone https://github.com/dlemstra/fontconfig fontconfig
        else
            cd fontconfig
            git reset --hard
            git pull origin main
            git checkout f4f1acf8393b3b0ff32f30bb30eb00404ae791ba
            cd ..
        fi
        cd ../../
    fi
}

function getCharset()
{
    local file=$1

    charset="$(file -bi $file | awk -F "=" '{print $2}')"
    if [ -z "$charset" ]; then
        charset="$(file -I $file | awk -F "=" '{print $2}')"
    fi
    echo $charset
}

function addCopyright()
{
    local copyrightFile=$1
    local notice=$2

    charset="$(getCharset $copyrightFile)"

    echo -e "Adding notice from '$copyrightFile' ($charset)"
    iconv -f $charset -t utf-8 $copyrightFile | sed -e 's/\xef\xbb\xbf//' | tr -d '\r' >> $notice
    echo -e "" >> $notice
}

function getImagemagickVersion()
{
    local folder=$1

    charset="$(getCharset "$folder/m4/version.m4")"
    version="$(iconv -f $charset -t utf-8 $folder/m4/version.m4 | sed -e 's/\xef\xbb\xbf//' | sed -e '/[rol]_version/! s/.*//' | sed -e 's/m4//' | sed -e 's/patchlevel_version/-/' | sed -e 's/minor_version/./' | sed -e 's/micro_version/./' | sed -e 's/[^0-9\.-]*//g' | tr -d '\r' | tr -d '\n')"

    tag=`git -C $folder describe --exact-match --tags HEAD 2>/dev/null`
    if [ -z "$tag" ]; then
        version="$version beta"
    fi

    date=`git -C $folder log -1 --format=%ci`
    date="$(echo $date | sed 's/ .*//')"
    version="$version ($date)"

    echo $version
}

function createNotice()
{
    local noticeFolder=$1

    if [ -z "$noticeFolder" ]; then
        noticeFolder="artifacts"
    fi

    mkdir -p $noticeFolder
    notice=$noticeFolder/NOTICE

    echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" > $notice
    echo -e "[ Magick.Native ] copyright:\n" >> $notice
    addCopyright "../Magick.Native/Copyright.txt" $notice

    echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice
    folder="imagemagick-windows/ImageMagick"
    version=$(getImagemagickVersion $folder)
    echo -e "[ ImageMagick $version ] copyright:\n" >> $notice
    addCopyright "$folder/LICENSE" $notice

    for dir in imagemagick-windows/Dependencies/* ; do
        config=$dir/.ImageMagick/Config.txt
        if [ ! -f "$config" ]; then
            echo -e "Unable to find '$config'"
            continue
        fi
        copyright="$(sed -n '/\[LICENSE\]/{n;p;}' $config | tr -d '[:space:]' | sed -e 's/\.\.\\//g' | sed -e 's/\\/\//g')"
        fileNames=$(echo $copyright | tr ";" "\n")

        echo -e "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n" >> $notice

        for fileName in $fileNames
        do
            fileName="$dir/$fileName"
            if [ ! -f "$fileName" ]; then
                echo -e "Unable to find '$fileName'"
                continue
            fi
            versionFolder=$(dirname $fileName)
            versionFile="$versionFolder/.ImageMagick/ImageMagick.version.h"
            if [ ! -f "$versionFile" ]; then
                versionFolder=$(dirname $versionFolder)
                versionFile="$versionFolder/.ImageMagick/ImageMagick.version.h"
                if [ ! -f "$versionFile" ]; then
                    echo -e "Unable to find '$versionFile'"
                    continue
                fi
            fi

            version="$(tail -n +2 $versionFile | awk -F " " '{print $3 " " $4}' | sed -e 's/"//g')"
            echo -e "[ $(basename $versionFolder) $version ] copyright:\n" >> $notice

            addCopyright $fileName $notice
        done
    done
}

platform=$1
noticeFolder=$2

cloneImageMagickWindows
cloneRepositories $platform
cloneFontconfig $platform
createNotice $noticeFolder
