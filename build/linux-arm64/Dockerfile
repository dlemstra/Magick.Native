FROM ubuntu:16.04

RUN mkdir /build

COPY build/linux-arm64/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/libraries/*.sh /build/

COPY build/linux-arm64/settings.sh /build

COPY build/linux-arm64/cross-compilation.* /build

COPY build/linux-arm64/build.libraries.sh /build

RUN cd /ImageMagick/libraries; /build/build.libraries.sh /build

COPY build/linux-arm64/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/linux-arm64/build.Native.sh /build

COPY src/Magick.Native /Magick.Native

RUN cd /Magick.Native; /build/build.Native.sh

COPY build/linux-arm64/copy.Native.sh /build