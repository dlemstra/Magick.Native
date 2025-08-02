#!/bin/bash
set -e

folder=$1
config=$2
architecture=$3

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/../$config-$architecture/settings.sh


verifyNative() {
  local name=$1

  local file=${folder}/Release${name}/$architecture/Magick.Native-${name}-$architecture.dll.$EXTENSION

  if [ ! -f $file ]; then
    echo "Unable to find $file"
    exit 1
  fi

  echo "Verifying $file"

  ld_arch=$architecture
  if [ $ld_arch == "x64" ]; then
      ld_arch="x86_64"
  fi

  exit_code=0
  output=$(lipo -info $file 2>&1) || exit_code=$?
  if [ $exit_code -ne 0 ]; then
    echo "Failed to execute lipo: $output"
    exit 1
  fi

  if echo "$output" | grep "is architecture: $ld_arch"; then
    echo "Verified architecture $file"
  else
    echo "Unexpected architecture for $file"
    echo $output
    exit 1
  fi

  macos_version=$(sw_vers -productVersion)
  # When specifying a platform version to ld, an error occurs, and so we need to specify the path to the
  # system shared libraries to apply -lSystem
  sdk_link="-L$(xcode-select -p)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib -lSystem"
  # clang-ld requires a `main` function, so we tell it that it's expected to be undefined with -U
  output=$(ld $file -arch $ld_arch -platform_version macos $macos_version $macos_version -U _main $sdk_link 2>&1) || exit_code=$?
  if [ $exit_code -ne 0 ]; then
    echo "Failed to execute ld: $output"
    exit 1
  fi

  if echo "$output" | grep "Undefined symbols for architecture"; then
    exit 1
  else
    echo "Verified ld status for $file"
  fi
}

for quantum in Q8 Q16 Q16-HDRI; do
  verifyNative $quantum
done

