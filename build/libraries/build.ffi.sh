cd ffi
autoreconf -fiv
$CONFIGURE --disable-shared --disable-docs CFLAGS="$FLAGS"
$MAKE install
