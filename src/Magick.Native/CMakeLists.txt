cmake_minimum_required (VERSION 2.8.8)

project(${LIBRARY_NAME})

set(OPENMP false BOOL)

add_definitions(-DMAGICK_NATIVE_${PLATFORM} -DMAGICKCORE_QUANTUM_DEPTH=${DEPTH} -DMAGICKCORE_HDRI_ENABLE=${HDRI_ENABLE})

include_directories(. /usr/local/include /usr/local/include/ImageMagick-7)

set(LIB_DIR /usr/local/lib)
set(CMAKE_CXX_FLAGS "-Wall -O3")

file(GLOB_RECURSE ALL_FILES . *.c)

if (PLATFORM STREQUAL "WASM")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --no-entry -fexceptions -s STRICT=1")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --bind --embed-file ${PROJECT_SOURCE_DIR}/Resources/xml@/xml -s ALLOW_MEMORY_GROWTH=1 -s SINGLE_FILE=1 -s MODULARIZE=1 -s EXPORT_NAME=\"'MagickNative'\" -s ALLOW_UNIMPLEMENTED_SYSCALLS=1 -s EXPORTED_RUNTIME_METHODS='[\"FS\", \"getValue\", \"setValue\", \"UTF8ToString\", \"lengthBytesUTF8\", \"stringToUTF8\"]'")
    #set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -g3 -s ASSERTIONS=2 -s SAFE_HEAP=1")
    set(LIBSOCKFS sockfs.js)
else()
    file(GLOB_RECURSE CMAKE_FILES **/CMakeFiles/*.c)
    list(REMOVE_ITEM ALL_FILES ${CMAKE_FILES})

    set(LIBAOM ${LIB_DIR}/libaom.a)
    set(LIBCAIRO ${LIB_DIR}/libcairo.a ${LIB_DIR}/libpixman-1.a)
    set(LIBFONTCONFIG ${LIB_DIR}/libfontconfig.a)
    set(LIBFRIBIDI ${LIB_DIR}/libfribidi.a)
    set(LIBHARFBUZZ ${LIB_DIR}/libharfbuzz.a)
    set(LIBPANGO ${LIB_DIR}/libpangocairo-1.0.a ${LIB_DIR}/libpango-1.0.a ${LIB_DIR}/libpangoft2-1.0.a)
    set(LIBRAQM ${LIB_DIR}/libraqm.a)
    set(LIBRSVG ${LIB_DIR}/librsvg-2.a ${LIB_DIR}/libgdk_pixbuf-2.0.a ${LIB_DIR}/libcroco-0.6.a)
    set(LIBWEBP ${LIB_DIR}/libwebpmux.a ${LIB_DIR}/libwebpdemux.a)

    set(LIBRESOLV -lresolv)
endif()

if (PLATFORM STREQUAL "MACOS")
    set(LIBICONV iconv)
    set(LIBINTL ${LIB_DIR}/libintl.a)
    set(CMAKE_MACOSX_RPATH 1)
    set(STDCPLUSPLUS stdc++)
elseif (PLATFORM STREQUAL "WASM")
    list(APPEND ALL_FILES foo.cxx)
else()
    list(APPEND ALL_FILES foo.cxx)
    find_package(Threads REQUIRED)

    set(LIBBZIP2 ${LIB_DIR}/libbz2.a)
    set(LIBJPEGXL ${LIB_DIR}/libjxl.a ${LIB_DIR}/libjxl_threads.a ${LIB_DIR}/libbrotlienc-static.a ${LIB_DIR}/libbrotlidec-static.a ${LIB_DIR}/libbrotlicommon-static.a ${LIB_DIR}/libhwy.a)
    set(LIBLZMA ${LIB_DIR}/liblzma.a)
    set(LIBZIP ${LIB_DIR}/libzip.a)

    set(STDCPLUSPLUS -static-libstdc++ -static-libgcc)
    set(LIBTHREAD Threads::Threads)
    if (OPENMP)
        set(LIBOPENMP -fopenmp)
    endif()
endif()

if (PLATFORM STREQUAL "WASM")
    add_executable(${LIBRARY_NAME} ${ALL_FILES})
else()
    add_library(${LIBRARY_NAME} SHARED ${ALL_FILES})
endif()

target_link_libraries(
    ${LIBRARY_NAME}

    ${LIB_DIR}/libMagickWand-7.${QUANTUM_NAME}.a
    ${LIB_DIR}/libMagickCore-7.${QUANTUM_NAME}.a

    ${LIB_DIR}/libOpenEXR-3_1.a
    ${LIB_DIR}/libOpenEXRUtil-3_1.a
    ${LIB_DIR}/libOpenEXRCore-3_1.a
    ${LIB_DIR}/libImath-3_1.a
    ${LIB_DIR}/libIex-3_1.a
    ${LIB_DIR}/libIlmThread-3_1.a
    ${LIBICONV}
    ${LIBINTL}
    ${LIB_DIR}/liblqr-1.a
    ${LIBRSVG}
    ${LIBPANGO}
    ${LIBCAIRO}
    ${LIB_DIR}/libgio-2.0.a
    ${LIB_DIR}/libgobject-2.0.a
    ${LIB_DIR}/libgmodule-2.0.a
    ${LIB_DIR}/libffi.a
    ${LIB_DIR}/libglib-2.0.a
    ${LIBFONTCONFIG}
    ${LIBJPEGXL}
    ${LIBRAQM}
    ${LIB_DIR}/libfreetype.a
    ${LIBFRIBIDI}
    ${LIBHARFBUZZ}
    ${LIB_DIR}/libxml2.a
    ${LIB_DIR}/libpng.a
    ${LIB_DIR}/libturbojpeg.a
    ${LIB_DIR}/libtiff.a
    ${LIBWEBP}
    ${LIB_DIR}/libwebp.a
    ${LIB_DIR}/libopenjp2.a
    ${LIB_DIR}/liblcms2.a
    ${LIB_DIR}/libheif.a
    ${LIBAOM}
    ${LIB_DIR}/libde265.a
    ${LIB_DIR}/libraw_r.a
    ${LIBZIP}
    ${LIBLZMA}
    ${LIBBZIP2}
    ${LIB_DIR}/libz.a

    ${LIBSOCKFS}
    ${LIBRESOLV}
    ${LIBOPENMP}
    ${LIBTHREAD}
    ${STDCPLUSPLUS}
)
