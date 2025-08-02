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
export LDFLAGS="-L$INSTALL_PREFIX/lib -L$INSTALL_PREFIX/lib64"
export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig:$INSTALL_PREFIX/lib64/pkgconfig"

# Settings
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS=""
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS=""
export EXTENSION="so"
export IMAGEMAGICK_OPTIONS=""
export MAKE="make -j$(nproc)"
export PLATFORM=LINUX
