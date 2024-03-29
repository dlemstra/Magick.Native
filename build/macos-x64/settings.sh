SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
    export FLAGS="-g3 -O0 -fPIC -DDEBUG"
    export CMAKE_BUILD_TYPE="Debug"
    export MESON_BUILD_TYPE="debug"
else
    export FLAGS="-O3 -fPIC -DNDEBUG"
    export CMAKE_BUILD_TYPE="Release"
    export MESON_BUILD_TYPE="release"
fi

# Shared options
export PLATFORM=MACOS
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
export EXTENSION="dylib"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS=""
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS=""
export MAKE="make"
export MAKEFLAGS="-j$(sysctl -n hw.logicalcpu)"
export MESON_OPTIONS=""
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=1"
export SSE_OPTIONS=""

# Library specific options
export FFI_OPTIONS=""
export FONTCONFIG_OPTIONS="--with-add-fonts=/System/Library/Fonts,/Library/Fonts,~/Library/Fonts"
export HEIF_OPTIONS=""
export LCMS_OPTIONS=""
export OPENEXR_OPTIONS=""
export WEBP_OPTIONS="--enable-libwebpmux --enable-libwebpdemux"
export IMAGEMAGICK_OPTIONS=""

# MacOS options
export GTKDOCIZE=true
export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH:/Library/Frameworks/Python.framework/Versions/3.11/bin
