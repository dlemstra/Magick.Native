# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
    export FLAGS="-g3 -O0 -Wall -DDEBUG -Wno-unused-function"
    export CMAKE_BUILD_TYPE="Debug"
else
    export FLAGS="-O3 -Wall -DNDEBUG -Wno-unused-function"
    export CMAKE_BUILD_TYPE="Release"
fi
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
export INSTALL_PREFIX="/tmp/dependencies"
export CPPFLAGS="-I$INSTALL_PREFIX/include"
export LDFLAGS="-L$INSTALL_PREFIX/lib"
export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"

# Settings
export CMAKE_COMMAND="emcmake cmake"
export CMAKE_OPTIONS=""
export CONFIGURE="emconfigure ./configure"
export CONFIGURE_OPTIONS=""
export EXTENSION="js"
export IMAGEMAGICK_OPTIONS="--disable-openmp --without-threads --without-bzlib --without-lzma"
export MAKE="emmake make -j$(nproc)"
export PLATFORM=WASM

# Wasm options
export CC=emcc
export CXX=em++
export EM_PKG_CONFIG_PATH=$PKG_CONFIG_PATH
export LIBRARY_NAME="magick"
