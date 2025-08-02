#!/bin/bash
set -e

folder=$1
platform=$2
architecture=$3
quantum=$4
openmp=$5

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$platform-$architecture/settings.sh

copyNative() {
  local quantum=$1

  local name=$quantum
  if [ "$openmp" == "OpenMP" ]; then
    name=${name}-OpenMP
  fi

  local targetFolder="$folder/Release$name/$platform-$architecture"
  mkdir -p $targetFolder
  cp $quantum/libMagick.Native-$name-$architecture.dll.$EXTENSION $targetFolder/Magick.Native-$name-$architecture.dll.$EXTENSION
}

[ "$folder" != "" ] && [ ! -d "$folder" ] && mkdir "$folder"

copyNative $quantum
