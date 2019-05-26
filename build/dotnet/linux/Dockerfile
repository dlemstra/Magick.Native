FROM ubuntu:bionic

RUN mkdir build

COPY build/dotnet/linux/install.dependencies.sh build

RUN cd /build; ./install.dependencies.sh

COPY src/ImageMagick ImageMagick

RUN cd /ImageMagick; ./checkout.sh Linux

COPY build/dotnet/linux/build.ImageMagick.sh build

RUN cd /ImageMagick/libraries; /build/build.ImageMagick.sh

COPY build/dotnet/linux/build.Native.sh build

COPY src/Native Native

RUN cd /Native; /build/build.Native.sh