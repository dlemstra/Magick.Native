FROM trzeci/emscripten:sdk-tag-1.38.31-64bit

RUN mkdir /build

COPY build/wasm/linux/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/wasm/linux/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/wasm/linux/build.Native.sh /build

COPY src/Native /Native

RUN cd /Native; /build/build.Native.sh

COPY build/wasm/linux/copy.Native.sh /build