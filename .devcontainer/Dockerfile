ARG image
FROM $image

ARG config
ENV DC_CONFIG=${config}

ARG arch
ENV DC_ARCH=${arch}

COPY build/${config}-${arch}/install.dependencies.sh /install.dependencies.sh

RUN /install.dependencies.sh

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh ${config}

RUN mkdir /build && mkdir /build/libraries && mkdir /build/shared && mkdir /build/${config}-${arch}

COPY build/libraries/*.sh /build/libraries/

COPY build/${config}-${arch}/settings.sh /build/${config}-${arch}/

COPY build/${config}-${arch}/libraries.sh /build/${config}-${arch}/

COPY build/${config}-${arch}/cross-compilatio[n].* /build/${config}-${arch}/

COPY build/shared/build.Libraries.sh /build/shared/

ARG debugBuild
ENV DC_DEBUG_BUILD=${debugBuild}

ARG openMP
ENV DC_OPEN_MP=${openMP}

RUN cd /ImageMagick/libraries; /build/shared/build.Libraries.sh /build/libraries ${config} ${arch} ${openMP}

COPY build/shared/build.ImageMagick.sh /build/shared/

RUN cd /ImageMagick/libraries; /build/shared/build.ImageMagick.sh ${config} ${arch} ${openMP}
