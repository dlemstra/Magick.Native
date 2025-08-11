cmake_minimum_required(VERSION 2.8...3.22)

project(${LIBRARY_NAME})

set(OPENMP false BOOL)

add_definitions(-DMAGICK_NATIVE_${PLATFORM} -DMAGICKCORE_QUANTUM_DEPTH=${DEPTH} -DMAGICKCORE_HDRI_ENABLE=${HDRI_ENABLE})

set(DEPENDENCIES_DIR "/tmp/dependencies")
include_directories(. ${DEPENDENCIES_DIR}/include /usr/local/include/ImageMagick-7)
link_directories(${DEPENDENCIES_DIR}/lib)

if (NOT PLATFORM STREQUAL "MACOS")
  link_directories(${DEPENDENCIES_DIR}/lib/x86_64-linux-gnu)
endif()

set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Wno-unused-function")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Wno-unused-function")
if (NOT (PLATFORM STREQUAL "MACOS") AND NOT (PLATFORM STREQUAL "WASM"))
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")
endif()

file(GLOB_RECURSE ALL_FILES . *.c)

if (PLATFORM STREQUAL "WASM")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --no-entry -fexceptions -s STRICT=1")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --bind --pre-js ${PROJECT_SOURCE_DIR}/../../build/wasm-x86/pre.js -s ALLOW_MEMORY_GROWTH=1 -s ALLOW_TABLE_GROWTH=1 -s MODULARIZE=1 -s EXPORT_ES6=1 -s DYNAMIC_EXECUTION=0 -s EMBIND_AOT=1 -s MAXIMUM_MEMORY=4294967296 -s ENVIRONMENT=web,webview,worker -s EXPORT_NAME=MagickNative -s ALLOW_UNIMPLEMENTED_SYSCALLS=1 -s EXPORTED_FUNCTIONS=_malloc,_free -s EXPORTED_RUNTIME_METHODS=FS,addFunction,getValue,HEAPU8,lengthBytesUTF8,setValue,stringToUTF8,UTF8ToString -s STACK_SIZE=1MB")

    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s ASSERTIONS=2")
    endif()

    set(LIBSOCKFS sockfs.js)
else()
    file(GLOB_RECURSE CMAKE_FILES **/CMakeFiles/*.c)
    list(REMOVE_ITEM ALL_FILES ${CMAKE_FILES})

    file(GLOB_RECURSE CFILES "${CMAKE_SOURCE_DIR}/*.c")
    SET_SOURCE_FILES_PROPERTIES(${CFILES} PROPERTIES LANGUAGE CXX)

    set(LIBBZIP2 libbz2.a)
    set(LIBCAIRO libcairo.a libpixman-1.a)
    set(LIBFONTCONFIG libfontconfig.a)
    set(LIBFRIBIDI libfribidi.a)
    set(LIBHARFBUZZ libharfbuzz.a)
    set(LIBLZMA liblzma.a)
    set(LIBPANGO libpangocairo-1.0.a libpango-1.0.a libpangoft2-1.0.a)
    set(LIBRAQM libraqm.a)
    set(LIBRSVG librsvg-2.a libgdk_pixbuf-2.0.a libcroco-0.6.a)
    set(LIBZIP libzip.a)

    set(LIBRESOLV -lresolv)
endif()

if (PLATFORM STREQUAL "MACOS")
    set(LIBICONV iconv)
    set(LIBINTL ${DEPENDENCIES_DIR}/lib/libintl.a)
    set(CMAKE_MACOSX_RPATH 1)
    set(STDCPLUSPLUS stdc++)
elseif (NOT PLATFORM STREQUAL "WASM")
    find_package(Threads REQUIRED)

    set(STDCPLUSPLUS -static-libstdc++ -static-libgcc)
    set(LIBTHREAD Threads::Threads)
    if (OPENMP)
        set(LIBOPENMP -fopenmp)
    endif()
endif()

set(LIBAOM libaom.a)
set(LIBDEFLATE libdeflate.a)
set(LIBGLIB libgio-2.0.a libgobject-2.0.a libgmodule-2.0.a libffi.a libglib-2.0.a)
set(LIBHEIF libheif.a ${LIBAOM} libde265.a)
set(LIBJPEG libturbojpeg.a)
set(LIBJPEGXL libjxl.a libjxl_threads.a libjxl_cms.a libbrotlienc.a libbrotlidec.a libbrotlicommon.a libhwy.a)
set(LIBLCMS liblcms2.a)
set(LIBLQR liblqr-1.a)
set(LIBOPENJPEG libopenjp2.a)
set(LIBOPENH264 libopenh264.a)
set(LIBPNG libpng.a)
set(LIBRAW libraw_r.a)
set(LIBTIFF libtiff.a)
set(LIBWEBP libwebpmux.a libwebpdemux.a libwebp.a libsharpyuv.a)
set(LIBXML libxml2.a)
set(LIBZ libz.a)

set(LIBEXR_VERSION 3_3)
set(LIBMATH_VERSION 3_1)
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(LIBEXR libOpenEXR-${LIBEXR_VERSION}_d.a libOpenEXRUtil-${LIBEXR_VERSION}_d.a libOpenEXRCore-${LIBEXR_VERSION}_d.a libImath-${LIBMATH_VERSION}_d.a libIex-${LIBEXR_VERSION}_d.a libIlmThread-${LIBEXR_VERSION}_d.a)
    set(LIBFREETYPE libfreetyped.a)
else()
    set(LIBEXR libOpenEXR-${LIBEXR_VERSION}.a libOpenEXRUtil-${LIBEXR_VERSION}.a libOpenEXRCore-${LIBEXR_VERSION}.a libImath-${LIBMATH_VERSION}.a libIex-${LIBEXR_VERSION}.a libIlmThread-${LIBEXR_VERSION}.a)
    set(LIBFREETYPE libfreetype.a)
endif()

if (PLATFORM STREQUAL "WASM")
    add_executable(${LIBRARY_NAME} ${ALL_FILES})
    unset(LIBOPENH264)
else()
    add_library(${LIBRARY_NAME} SHARED ${ALL_FILES})
    set_target_properties(${LIBRARY_NAME} PROPERTIES LINKER_LANGUAGE CXX)
endif()

target_link_libraries(
    ${LIBRARY_NAME}

    /usr/local/lib/libMagickWand-7.${QUANTUM_NAME}.a
    /usr/local/lib/libMagickCore-7.${QUANTUM_NAME}.a

    ${LIBEXR}
    ${LIBDEFLATE}
    ${LIBICONV}
    ${LIBINTL}
    ${LIBLQR}
    ${LIBRSVG}
    ${LIBPANGO}
    ${LIBCAIRO}
    ${LIBGLIB}
    ${LIBFONTCONFIG}
    ${LIBJPEGXL}
    ${LIBRAQM}
    ${LIBFREETYPE}
    ${LIBFRIBIDI}
    ${LIBHARFBUZZ}
    ${LIBXML}
    ${LIBPNG}
    ${LIBJPEG}
    ${LIBTIFF}
    ${LIBWEBP}
    ${LIBOPENJPEG}
    ${LIBLCMS}
    ${LIBOPENH264}
    ${LIBHEIF}
    ${LIBRAW}
    ${LIBZIP}
    ${LIBLZMA}
    ${LIBBZIP2}
    ${LIBZ}

    ${LIBSOCKFS}
    ${LIBRESOLV}
    ${LIBOPENMP}
    ${LIBTHREAD}
    ${STDCPLUSPLUS}
)
