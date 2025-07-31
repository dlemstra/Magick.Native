# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
  export FLAGS="-g3 -O0 -fPIC -Wall -DDEBUG"
  export CMAKE_BUILD_TYPE="Debug"
else
  export FLAGS="-O3 -fPIC -Wall -DNDEBUG"
  export CMAKE_BUILD_TYPE="Release"
fi
export INSTALL_PREFIX="/tmp/dependencies"
export CFLAGS=$FLAGS
export CXXFLAGS=$FLAGS
export CPPFLAGS="-I$INSTALL_PREFIX/include"
export LDFLAGS="-L$INSTALL_PREFIX/lib"
export PKG_CONFIG_PATH="$INSTALL_PREFIX/lib/pkgconfig"

# Settings
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS=""
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS=""
export EXTENSION="dylib"
export IMAGEMAGICK_OPTIONS=""
export PLATFORM=MACOS
export MAKE="make -j$(sysctl -n hw.logicalcpu)"
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
