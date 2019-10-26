FROM trzeci/emscripten:1.39.0

RUN mkdir /build

COPY build/wasm/linux/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/wasm/linux/patches/*.patch /ImageMagick/libraries

COPY build/wasm/linux/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/wasm/linux/build.Native.sh /build

COPY src/Magick.Native /Magick.Native

RUN cd /Magick.Native; /build/build.Native.sh

COPY build/wasm/linux/copy.Native.sh /build

COPY src/create-type-definition /create-type-definition

RUN cd /create-type-definition; npm install && npm run publish