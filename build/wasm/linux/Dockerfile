FROM trzeci/emscripten:sdk-tag-1.38.31-64bit

RUN apt-get update -y

RUN apt-get install -y autoconf libtool shtool autogen pkg-config gperf nasm

COPY src/ImageMagick ImageMagick

RUN cd /src/ImageMagick; ./checkout.sh Linux

RUN mkdir build

COPY build/wasm/linux/build.ImageMagick.sh build

RUN cd /src/build; ./build.ImageMagick.sh

COPY build/wasm/linux/build.Native.sh build

COPY src/Native Native

RUN cd /src/build; ./build.Native.sh

COPY build/wasm/linux/copy.output.sh build