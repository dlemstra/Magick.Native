FROM ubuntu:18.04

COPY build/linux-x64/install.dependencies.sh /install.dependencies.sh

RUN /install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh linux

RUN mkdir /build && mkdir /build/libraries && mkdir /build/shared && mkdir /build/linux-x64

COPY build/libraries/*.sh /build/libraries

COPY build/linux-x64/settings.sh /build/linux-x64

COPY build/linux-x64/libraries.sh /build/linux-x64

#ENV DEBUG_BUILD=1

COPY build/shared/build.Libraries.sh /build/shared

RUN cd /ImageMagick/libraries; /build/shared/build.Libraries.sh /build/libraries linux x64

COPY build/shared/build.ImageMagick.sh /build/shared

RUN cd /ImageMagick/libraries; /build/shared/build.ImageMagick.sh linux x64
