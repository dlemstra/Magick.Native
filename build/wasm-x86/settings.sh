SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
    export FLAGS="-g3 -O0 -DDEBUG"
    export CMAKE_BUILD_TYPE="Debug"
else
    export FLAGS="-O3 -DNDEBUG"
    export CMAKE_BUILD_TYPE="Release"
fi

# Shared options
export PLATFORM=WASM
export QUANTUMS=("Q8")
export EXTENSION="js"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="emconfigure ./configure"
export CONFIGURE_OPTIONS=""
export CMAKE_COMMAND="emcmake cmake"
export CMAKE_OPTIONS=""
export MAKE="emmake make"
export MAKEFLAGS="-j$(nproc)"
export MESON_OPTIONS="--cross-file=$SCRIPT_PATH/cross-compilation.meson"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=0"
export SSE_OPTIONS="--disable-sse"

# Library specific options
export FFI_OPTIONS="--disable-exec-static-tramp"
export FONTCONFIG_OPTIONS=""
export HEIF_OPTIONS="--disable-multithreading"
export OPENEXR_OPTIONS="-DZLIB_LIBRARY=/usr/local/lib/libz.a -DZLIB_INCLUDE_DIR=/usr/local/include -DImath_DIR=/usr/local/lib/cmake/Imath"
export WEBP_OPTIONS=""
export XML_OPTIONS=""
export IMAGEMAGICK_OPTIONS="--disable-openmp --without-threads --without-bzlib --without-lzma"

# WASM options
export CC=emcc
export CXX=em++
export EM_PKG_CONFIG_PATH=$PKG_PATH
