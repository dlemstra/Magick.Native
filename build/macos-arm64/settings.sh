# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
  export FLAGS="-g3 -O0 -fPIC -Wall -DDEBUG -arch arm64"
  export CMAKE_BUILD_TYPE="Debug"
else
  export FLAGS="-O3 -fPIC -Wall -DNDEBUG -arch arm64"
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
export CMAKE_OPTIONS="-DCMAKE_OSX_ARCHITECTURES=arm64"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS="--host arm64-apple-macos13"
export EXTENSION="dylib"
export IMAGEMAGICK_OPTIONS=""
export MAKE="make -j$(sysctl -n hw.logicalcpu)"
export PLATFORM=MACOS
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
