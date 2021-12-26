FROM emscripten/emsdk:3.1.0

RUN mkdir /build

COPY build/wasm/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh wasm

RUN mkdir /build/patches

COPY build/wasm/patches/* /build/patches/

RUN cd /ImageMagick/libraries; /build/patches/install.patches.sh

COPY build/libraries/*.sh /build/

COPY build/wasm/settings.sh /build

COPY build/wasm/build.libraries.sh /build

RUN cd /ImageMagick/libraries; /build/build.libraries.sh /build

COPY build/wasm/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/wasm/build.Native.sh /build

COPY src/Magick.Native /Magick.Native

RUN cd /Magick.Native; /build/build.Native.sh

COPY build/wasm/copy.Native.sh /build

COPY src/create-type-definition /create-type-definition

RUN cd /create-type-definition; npm install && npm run publish
