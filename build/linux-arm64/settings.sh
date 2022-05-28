SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Shared options
export PLATFORM=LINUX
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
export EXTENSION="so"
export FLAGS="-O3 -fPIC"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS="--host aarch64-linux-gnu"
export CMAKE_COMMAND="cmake"
export MAKE="make"
export MESON_OPTIONS="--cross-file=$SCRIPT_PATH/cross-compilation.meson"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export CONDITIONAL_DISABLE_SHARED=""
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=0"
export SSE_OPTIONS=""

# Library specific options
export FFI_OPTIONS=""
export FONTCONFIG_OPTIONS=""
export OPENEXR_OPTIONS=""
export WEBP_OPTIONS="--enable-libwebpmux --enable-libwebpdemux"
export XML_OPTIONS=""
export IMAGEMAGICK_OPTIONS=""

# Linux ARM64 options
export CC=aarch64-linux-gnu-gcc
export CXX=aarch64-linux-gnu-g++
