cd libxml
autoreconf -fiv
$CONFIGURE --with-python=no --enable-static --disable-shared $LIBXML_OPTIONS CFLAGS="$FLAGS"
$MAKE install
