cd libheif
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared --disable-go --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS" PKG_CONFIG_PATH="$PKG_PATH"
$MAKE install
