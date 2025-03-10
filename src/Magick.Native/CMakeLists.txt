cmake_minimum_required(VERSION 2.8...3.22)

project(${LIBRARY_NAME})

set(OPENMP false BOOL)

add_definitions(-DMAGICK_NATIVE_${PLATFORM} -DMAGICKCORE_QUANTUM_DEPTH=${DEPTH} -DMAGICKCORE_HDRI_ENABLE=${HDRI_ENABLE})

include_directories(. /usr/local/include /usr/local/include/ImageMagick-7)

set(LIB_DIR /usr/local/lib)

if (NOT (PLATFORM STREQUAL "MACOS") AND NOT (PLATFORM STREQUAL "WASM"))
    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")
endif()

file(GLOB_RECURSE ALL_FILES . *.c)

if (PLATFORM STREQUAL "WASM")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --no-entry -fexceptions -s STRICT=1")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --bind --pre-js ${PROJECT_SOURCE_DIR}/../../build/wasm-x86/pre.js -s ALLOW_MEMORY_GROWTH=1 -s ALLOW_TABLE_GROWTH=1 -s MODULARIZE=1 -s EXPORT_ES6=1 -s WASM_BIGINT=1 -s MAXIMUM_MEMORY=4294967296 -s ENVIRONMENT=web,webview,worker -s EXPORT_NAME=MagickNative -s ALLOW_UNIMPLEMENTED_SYSCALLS=1 -s EXPORTED_FUNCTIONS=_malloc,_free -s EXPORTED_RUNTIME_METHODS=FS,addFunction,getValue,lengthBytesUTF8,setValue,stringToUTF8,UTF8ToString -s STACK_SIZE=1MB")

    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -s ASSERTIONS=2")
    endif()

    set(LIBSOCKFS sockfs.js)
else()
    file(GLOB_RECURSE CMAKE_FILES **/CMakeFiles/*.c)
    list(REMOVE_ITEM ALL_FILES ${CMAKE_FILES})

    file(GLOB_RECURSE CFILES "${CMAKE_SOURCE_DIR}/*.c")
    SET_SOURCE_FILES_PROPERTIES(${CFILES} PROPERTIES LANGUAGE CXX)

    set(LIBBZIP2 ${LIB_DIR}/libbz2.a)
    set(LIBCAIRO ${LIB_DIR}/libcairo.a ${LIB_DIR}/libpixman-1.a)
    set(LIBFONTCONFIG ${LIB_DIR}/libfontconfig.a)
    set(LIBFRIBIDI ${LIB_DIR}/libfribidi.a)
    set(LIBHARFBUZZ ${LIB_DIR}/libharfbuzz.a)
    set(LIBLZMA ${LIB_DIR}/liblzma.a)
    set(LIBPANGO ${LIB_DIR}/libpangocairo-1.0.a ${LIB_DIR}/libpango-1.0.a ${LIB_DIR}/libpangoft2-1.0.a)
    set(LIBRAQM ${LIB_DIR}/libraqm.a)
    set(LIBRSVG ${LIB_DIR}/librsvg-2.a ${LIB_DIR}/libgdk_pixbuf-2.0.a ${LIB_DIR}/libcroco-0.6.a)
    set(LIBZIP ${LIB_DIR}/libzip.a)

    set(LIBRESOLV -lresolv)
endif()

if (PLATFORM STREQUAL "MACOS")
    set(LIBICONV iconv)
    set(LIBINTL ${LIB_DIR}/libintl.a)
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

set(LIBAOM ${LIB_DIR}/libaom.a)
set(LIBDEFLATE ${LIB_DIR}/libdeflate.a)
set(LIBGLIB ${LIB_DIR}/libgio-2.0.a ${LIB_DIR}/libgobject-2.0.a ${LIB_DIR}/libgmodule-2.0.a ${LIB_DIR}/libffi.a ${LIB_DIR}/libglib-2.0.a)
set(LIBHEIF ${LIB_DIR}/libheif.a ${LIBAOM} ${LIB_DIR}/libde265.a)
set(LIBJPEG ${LIB_DIR}/libturbojpeg.a)
set(LIBJPEGXL ${LIB_DIR}/libjxl.a ${LIB_DIR}/libjxl_threads.a ${LIB_DIR}/libjxl_cms.a ${LIB_DIR}/libbrotlienc.a ${LIB_DIR}/libbrotlidec.a ${LIB_DIR}/libbrotlicommon.a ${LIB_DIR}/libhwy.a)
set(LIBLCMS ${LIB_DIR}/liblcms2.a)
set(LIBLQR ${LIB_DIR}/liblqr-1.a)
set(LIBOPENJPEG ${LIB_DIR}/libopenjp2.a)
set(LIBOPENH264 ${LIB_DIR}/libopenh264.a)
set(LIBPNG ${LIB_DIR}/libpng.a)
set(LIBRAW ${LIB_DIR}/libraw_r.a)
set(LIBTIFF ${LIB_DIR}/libtiff.a)
set(LIBWEBP ${LIB_DIR}/libwebpmux.a ${LIB_DIR}/libwebpdemux.a ${LIB_DIR}/libwebp.a ${LIB_DIR}/libsharpyuv.a)
set(LIBXML ${LIB_DIR}/libxml2.a)
set(LIBZ ${LIB_DIR}/libz.a)

set(LIBEXR_VERSION 3_3)
set(LIBMATH_VERSION 3_1)
if (CMAKE_BUILD_TYPE STREQUAL "Debug")
    set(LIBEXR ${LIB_DIR}/libdeflate.a ${LIB_DIR}/libOpenEXR-${LIBEXR_VERSION}_d.a ${LIB_DIR}/libOpenEXRUtil-${LIBEXR_VERSION}_d.a ${LIB_DIR}/libOpenEXRCore-${LIBEXR_VERSION}_d.a ${LIB_DIR}/libImath-${LIBMATH_VERSION}_d.a ${LIB_DIR}/libIex-${LIBEXR_VERSION}_d.a ${LIB_DIR}/libIlmThread-${LIBEXR_VERSION}_d.a)
    set(LIBFREETYPE ${LIB_DIR}/libfreetyped.a)
else()
    set(LIBEXR ${LIB_DIR}/libdeflate.a ${LIB_DIR}/libOpenEXR-${LIBEXR_VERSION}.a ${LIB_DIR}/libOpenEXRUtil-${LIBEXR_VERSION}.a ${LIB_DIR}/libOpenEXRCore-${LIBEXR_VERSION}.a ${LIB_DIR}/libImath-${LIBMATH_VERSION}.a ${LIB_DIR}/libIex-${LIBEXR_VERSION}.a ${LIB_DIR}/libIlmThread-${LIBEXR_VERSION}.a)
    set(LIBFREETYPE ${LIB_DIR}/libfreetype.a)
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

    ${LIB_DIR}/libMagickWand-7.${QUANTUM_NAME}.a
    ${LIB_DIR}/libMagickCore-7.${QUANTUM_NAME}.a

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
