cd freetype
./autogen.sh
$CONFIGURE --disable-shared --without-bzip2 CFLAGS="$FLAGS"
$MAKE install
make clean
mkdir build
cd build
$CMAKE_COMMAND .. -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_SHARED=off -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
