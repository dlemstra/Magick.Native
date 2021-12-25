#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/settings.sh

$1/build.zlib.sh
$1/build.libxml.sh
$1/build.libpng.sh
$1/build.freetype.sh
$1/build.libjpeg-turbo.sh
$1/build.libtiff.sh
$1/build.libwebp.sh
$1/build.openjpeg.sh
$1/build.lcms.sh
$1/build.libde265.sh
$1/build.libheif.sh
$1/build.libraw.sh
$1/build.openexr.sh
$1/build.ffi.sh
$1/build.glib.sh
$1/build.lqr.sh
