ARG image
FROM $image

ARG config
ENV DC_CONFIG=${config}

ARG arch
ENV DC_ARCH=${arch}

COPY build/${config}-${arch}/install.build-tools.sh /install.build-tools.sh

RUN /install.build-tools.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh ${config}

RUN mkdir /build && mkdir /build/dependencies && mkdir /build/shared && mkdir /build/${config}-${arch}

COPY build/dependencies/*.sh /build/dependencies/

COPY build/${config}-${arch}/settings.sh /build/${config}-${arch}/

COPY build/${config}-${arch}/build.dependencies.sh /build/${config}-${arch}/

COPY build/${config}-${arch}/cross-compilatio[n].* /build/${config}-${arch}/

COPY build/shared/build.dependencies.sh /build/shared/

ARG debugBuild
ENV DEBUG_BUILD=${debugBuild}

ARG openMP
ENV DC_OPEN_MP=${openMP}

RUN cd /ImageMagick/imagemagick-windows/Dependencies; /build/shared/build.dependencies.sh /build/dependencies ${config} ${arch} ${openMP}

COPY build/shared/build.imagemagick.sh /build/shared/

RUN cd /ImageMagick/imagemagick-windows/ImageMagick; /build/shared/build.imagemagick.sh ${config} ${arch} ${openMP}

RUN  echo 'alias settings="source /build/${config}-${arch}/settings.sh"' ~/.bashrc
