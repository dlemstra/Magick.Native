cd libde265
autoreconf -fiv
chmod +x ./configure
$CONFIGURE --disable-shared $SSE_OPTIONS --disable-dec265 --prefix=/usr/local CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
$MAKE install
