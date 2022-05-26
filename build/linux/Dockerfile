FROM ubuntu:16.04

RUN mkdir /build && mkdir /build/libraries && mkdir /build/shared && mkdir /build/linux

COPY build/linux/install.dependencies.sh /build/linux

RUN cd /build/linux; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/libraries/*.sh /build/libraries

COPY build/linux/settings.sh /build/linux

COPY build/linux/build.libraries.sh /build/linux

RUN cd /ImageMagick/libraries; /build/linux/build.libraries.sh /build/libraries

COPY build/shared/build.ImageMagick.sh /build/shared

ARG OpenMP

RUN cd /ImageMagick/libraries; /build/shared/build.ImageMagick.sh linux ${OpenMP}

COPY src/Magick.Native /Magick.Native

COPY build/shared/build.Native.sh /build/shared

RUN cd /Magick.Native; /build/shared/build.Native.sh linux x64 $OpenMP

COPY build/shared/copy.Native.sh /build/shared
