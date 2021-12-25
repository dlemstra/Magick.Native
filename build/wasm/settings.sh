export FLAGS="-O3"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="emconfigure ./configure"
export CMAKE_COMMAND="emcmake cmake"
export MAKE="emmake make"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export CONDITIONAL_DISABLE_SHARED="--disable-shared"
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=0"
export SSE_OPTIONS="--disable-sse"

export FFI_OPTIONS="--disable-exec-static-tramp"
export FONTCONFIG_OPTIONS=""
export GLIB_OPTIONS="--cross-file=../emscripten-crossfile.meson"
export LIBXML_OPTIONS=""
export OPENEXR_OPTIONS="-DZLIB_LIBRARY=/usr/local/lib/libz.a -DZLIB_INCLUDE_DIR=/usr/local/include -DImath_DIR=/usr/local/lib/cmake/Imath"
export WEBP_OPTIONS=""

export IMAGEMAGICK_OPTIONS="--disable-openmp --without-threads --without-bzlib --without-lzma"

export EM_PKG_CONFIG_PATH=$PKG_PATH
