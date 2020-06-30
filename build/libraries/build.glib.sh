cd glib
git reset 586514423cb4dc09876dad095641f5b44fb2683d --hard
mkdir build
cd build
export CFLAGS="$FLAGS"
meson --prefix=/usr/local --default-library=static -Dselinux=disabled -Dxattr=false -Dlibmount=disabled -Dnls=disabled -Dinternal_pcre=true -Dgtk_doc=false -Dman=false ..
ninja install
if [ -f /usr/local/lib/x86_64-linux-gnu/libglib-2.0.a ]; then
  cp /usr/local/lib/x86_64-linux-gnu/libglib-2.0.a /usr/local/lib/libglib-2.0.a
fi
