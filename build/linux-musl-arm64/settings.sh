SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
  export FLAGS="-g3 -O0 -fPIC -Wall -DDEBUG"
  export CMAKE_BUILD_TYPE="Debug"
else
  export FLAGS="-O3 -fPIC -Wall -DNDEBUG"
  export CMAKE_BUILD_TYPE="Release"
fi
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
export INSTALL_PREFIX="/tmp/dependencies"
export CPPFLAGS="-I$INSTALL_PREFIX/include"
export LDFLAGS="-L$INSTALL_PREFIX/lib"
export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"

# Settings
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS="-DCMAKE_TOOLCHAIN_FILE=$SCRIPT_PATH/cross-compilation.cmake"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS="--host aarch64-alpine-linux-musl"
export EXTENSION="so"
export IMAGEMAGICK_OPTIONS=""
export MAKE="make -j$(nproc)"
export PLATFORM=LINUX

# Set compiler for cross-compilation
export CC="clang-18 --target=aarch64-alpine-linux-musl --sysroot=/usr/aarch64-alpine-linux-musl"
export CXX="clang++-18 --target=aarch64-alpine-linux-musl --sysroot=/usr/aarch64-alpine-linux-musl"
