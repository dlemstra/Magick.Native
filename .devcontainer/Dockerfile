ARG image
FROM $image

ARG platform

ARG config
ENV DC_CONFIG=${config}

ARG arch
ENV DC_ARCH=${arch}

COPY build/${config}-${arch}/install.build-tools.sh /install.build-tools.sh

RUN /install.build-tools.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh --no-configure --dependencies-artifact ${config}-${arch}-static.zip

RUN mkdir /build && mkdir /build/shared && mkdir /build/${config}-${arch}

COPY build/${config}-${arch}/settings.sh /build/${config}-${arch}/

COPY build/${config}-${arch}/cross-compilatio[n].* /build/${config}-${arch}/

ARG debugBuild
ENV DEBUG_BUILD=${debugBuild}

ARG openMP
ENV DC_OPEN_MP=${openMP}

ARG quantum
ENV DC_QUANTUM=${quantum}

COPY build/shared/build.imagemagick.sh /build/shared/

RUN cd /ImageMagick/ImageMagick; /build/shared/build.imagemagick.sh ${config} ${arch} ${quantum} ${openMP}

RUN  echo 'alias settings="source /build/${config}-${arch}/settings.sh"' ~/.bashrc
