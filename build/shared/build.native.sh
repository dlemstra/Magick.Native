#!/bin/bash
set -e

config=$1
architecture=$2
quantum=$3
openmp=$4

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$architecture/settings.sh

getLibraryName() {
    if [[ -n "${LIBRARY_NAME}" ]]; then
        echo $LIBRARY_NAME
    else
        local quantum=$1
        if [ "$openmp" == "OpenMP" ]; then
            echo Magick.Native-$quantum-OpenMP-$architecture.dll
        else
            echo Magick.Native-$quantum-$architecture.dll
        fi
    fi
}

buildNative() {
  local quantum=$1

  local quantum_name=$quantum
  local library_name=$(getLibraryName $quantum)
  local depth=8
  local hdri_enable=0
  local openmp_enable=0
  if [ "$quantum" == "Q16" ]; then
    depth=16
  elif [ "$quantum" == "Q16-HDRI" ]; then
    quantum_name=Q16HDRI
    depth=16
    hdri_enable=1
  fi

  if [ "$openmp" == "OpenMP" ]; then
    openmp_enable=1
  fi

  if [ -d $quantum ]; then
    rm -Rf $quantum
  fi
  mkdir $quantum
  cd $quantum

  $CMAKE_COMMAND $CMAKE_OPTIONS -DDEPTH=$depth -DHDRI_ENABLE=$hdri_enable -DOPENMP=$openmp_enable -DQUANTUM_NAME=$quantum_name -DLIBRARY_NAME=$library_name -DPLATFORM=$PLATFORM -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE ..
  make

  cd ..
}

buildNative $quantum
