SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Shared options
export PLATFORM=WASM
export QUANTUMS=("Q8")
export FLAGS="-O3"
export EXTENSION="dll.js"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="emconfigure ./configure"
export CONFIGURE_OPTIONS=""
export CMAKE_COMMAND="emcmake cmake"
export MAKE="emmake make"
export MESON_OPTIONS="--cross-file=$SCRIPT_PATH/cross-compilation.meson"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export CONDITIONAL_DISABLE_SHARED="--disable-shared"
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=0"
export SSE_OPTIONS="--disable-sse"

# Library specific options
export FFI_OPTIONS="--disable-exec-static-tramp"
export FONTCONFIG_OPTIONS=""
export OPENEXR_OPTIONS="-DZLIB_LIBRARY=/usr/local/lib/libz.a -DZLIB_INCLUDE_DIR=/usr/local/include -DImath_DIR=/usr/local/lib/cmake/Imath"
export WEBP_OPTIONS=""
export XML_OPTIONS=""
export IMAGEMAGICK_OPTIONS="--disable-openmp --without-threads --without-bzlib --without-lzma"

# WASM options
export CC=emcc
export CXX=em++
export EM_PKG_CONFIG_PATH=$PKG_PATH
