FROM ubuntu:16.04

RUN mkdir /build

COPY build/linux-openmp/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/libraries/*.sh /build/

COPY build/linux-openmp/settings.sh /build

COPY build/linux-openmp/build.libraries.sh /build

RUN cd /ImageMagick/libraries; /build/build.libraries.sh /build

COPY build/linux-openmp/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/linux-openmp/build.Native.sh /build

COPY src/Magick.Native /Magick.Native

RUN cd /Magick.Native; /build/build.Native.sh

COPY build/linux-openmp/copy.Native.sh /build