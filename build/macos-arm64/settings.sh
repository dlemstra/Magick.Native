SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Shared options
export PLATFORM=MACOS
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
export EXTENSION="dylib"
export FLAGS="-O3 -fPIC -arch arm64"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS="--host arm64-apple-macos11"
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS="-DCMAKE_OSX_ARCHITECTURES=arm64"
export MAKE="make"
export MAKEFLAGS="-j$(sysctl -n hw.logicalcpu)"
export MESON_OPTIONS="--cross-file=$SCRIPT_PATH/cross-compilation.meson"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
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
