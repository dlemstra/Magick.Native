FROM alpine:3.12

RUN mkdir /build

COPY build/linux-musl/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/libraries/*.sh /build/

COPY build/linux-musl/settings.sh /build

COPY build/linux-musl/build.libraries.sh /build

RUN cd /ImageMagick/libraries; /build/build.libraries.sh /build

COPY build/linux/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/linux-musl/build.Native.sh /build

COPY src/Magick.Native /Magick.Native

RUN cd /Magick.Native; /build/build.Native.sh

COPY build/linux-musl/copy.Native.sh /build