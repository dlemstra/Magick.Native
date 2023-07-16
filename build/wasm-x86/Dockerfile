FROM emscripten/emsdk:3.1.42

COPY build/wasm-x86/install.dependencies.sh /install.dependencies.sh

RUN /install.dependencies.sh

RUN apt-get install -y vim

COPY src/ImageMagick /ImageMagick

RUN cd /ImageMagick; ./checkout.sh wasm

RUN mkdir /build && mkdir /build/libraries && mkdir /build/shared && mkdir /build/wasm-x86

COPY build/libraries/*.sh /build/libraries

COPY build/wasm-x86/settings.sh /build/wasm-x86

COPY build/wasm-x86/libraries.sh /build/wasm-x86

COPY build/wasm-x86/cross-compilation.* /build/wasm-x86

#ENV DEBUG_BUILD=1

COPY build/shared/build.Libraries.sh /build/shared

RUN cd /ImageMagick/libraries; /build/shared/build.Libraries.sh /build/libraries wasm x86

COPY build/shared/build.ImageMagick.sh /build/shared

RUN cd /ImageMagick/libraries; /build/shared/build.ImageMagick.sh wasm x86
