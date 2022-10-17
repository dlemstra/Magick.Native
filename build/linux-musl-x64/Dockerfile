FROM alpine:3.12

RUN mkdir /build && mkdir /build/libraries && mkdir /build/shared && mkdir /build/linux-musl-x64

COPY build/linux-musl-x64/install.dependencies.sh /build/linux-musl-x64

RUN cd /build/linux-musl-x64; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/libraries/*.sh /build/libraries

COPY build/linux-musl-x64/settings.sh /build/linux-musl-x64

COPY build/linux-musl-x64/libraries.sh /build/linux-musl-x64

#ENV DEBUG_BUILD=1

COPY build/shared/build.Libraries.sh /build/shared

RUN cd /ImageMagick/libraries; /build/shared/build.Libraries.sh /build/libraries linux-musl x64

COPY build/shared/build.ImageMagick.sh /build/shared

ARG OpenMP

RUN cd /ImageMagick/libraries; /build/shared/build.ImageMagick.sh linux-musl x64 ${OpenMP}

COPY src/Magick.Native /Magick.Native

COPY build/shared/build.Native.sh /build/shared

RUN cd /Magick.Native; /build/shared/build.Native.sh linux-musl x64 $OpenMP

COPY build/shared/copy.Native.sh /build/shared
