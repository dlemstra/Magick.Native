#!/bin/bash
set -e

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
. $SCRIPT_PATH/settings.sh

$1/build.zlib.sh
$1/build.liblzma.sh
$1/build.bzlib.sh
$1/build.libzip.sh
$1/build.libxml.sh
$1/build.libpng.sh
$1/build.freetype.sh
$1/build.fontconfig.sh
$1/build.libjpeg-turbo.sh
$1/build.libtiff.sh
$1/build.libwebp.sh
$1/build.openjpeg.sh
$1/build.lcms.sh
$1/build.libde265.sh
$1/build.aom.sh
$1/build.libheif.sh
$1/build.libraw.sh
$1/build.openexr.sh
$1/build.ffi.sh
$1/build.glib.sh
$1/build.lqr.sh
$1/build.pixman.sh
$1/build.cairo.sh
$1/build.fribidi.sh
$1/build.harfbuzz.sh
$1/build.pango.sh
$1/build.croco.sh
$1/build.librsvg.sh
$1/build.raqm.sh
$1/build.highway.sh
$1/build.brotli.sh
$1/build.jpeg-xl.sh
