cd webp
autoreconf -fiv
chmod +x ./configure
$CONFIGURE ${WEBP_OPTIONS} --disable-shared CFLAGS="${FLAGS}"
$MAKE install
