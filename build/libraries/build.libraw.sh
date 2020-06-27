cd libraw
chmod +x ./version.sh
chmod +x ./shlib-version.sh
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-examples --disable-openmp --disable-jpeg --disable-jasper --prefix=/usr/local  CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install
