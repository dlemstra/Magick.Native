FROM ubuntu:16.04

RUN mkdir /build

COPY build/dotnet/linux/install.dependencies.sh /build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

COPY build/dotnet/linux/build.ImageMagick.sh /build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/dotnet/linux/build.Native.sh /build

COPY src/Magick.Native /Magick.Native

RUN cd /Magick.Native; /build/build.Native.sh

COPY build/dotnet/linux/copy.Native.sh /build