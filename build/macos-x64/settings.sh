SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Shared options
export PLATFORM="MACOS"
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
export EXTENSION="dylib"
export FLAGS="-O3 -fPIC"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS=""
export CMAKE_COMMAND="cmake"
export MAKE="make"
export MESON_OPTIONS=""
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export CONDITIONAL_DISABLE_SHARED=""
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=1"
export SSE_OPTIONS=""

# Library specific options
export FFI_OPTIONS=""
export FONTCONFIG_OPTIONS="--with-add-fonts=/System/Library/Fonts,/Library/Fonts,~/Library/Fonts"
export OPENEXR_OPTIONS=""
export WEBP_OPTIONS="--enable-libwebpmux --enable-libwebpdemux"
export XML_OPTIONS="--with-iconv=/usr/local/opt/libiconv"
export IMAGEMAGICK_OPTIONS="--without-bzlib --without-lzma"
