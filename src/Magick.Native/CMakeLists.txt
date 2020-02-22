cmake_minimum_required (VERSION 2.8.8)

project(${LIBRARY_NAME})

add_definitions(-DMAGICK_NATIVE_${PLATFORM} -DMAGICKCORE_QUANTUM_DEPTH=${DEPTH} -DMAGICKCORE_HDRI_ENABLE=${HDRI_ENABLE})

include_directories(. /usr/local/include /usr/local/include/ImageMagick-7)

set(LIB_DIR /usr/local/lib/)
set(CMAKE_CXX_FLAGS "-Wall -O3")

file(GLOB_RECURSE ALL_FILES . *.c)

if (PLATFORM STREQUAL "WASM")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 --bind --no-heap-copy -s WASM=1 -s STRICT=1 -s ALLOW_MEMORY_GROWTH=1 -s EMULATE_FUNCTION_POINTER_CASTS=1 -s SINGLE_FILE=1 -s MODULARIZE=1 -s EXPORT_NAME=\"'MagickNative'\" -s BINARYEN_TRAP_MODE=clamp -s --embed-file ${PROJECT_SOURCE_DIR}/Resources/xml@/xml -s EXTRA_EXPORTED_RUNTIME_METHODS='[\"getValue\", \"setValue\", \"UTF8ToString\", \"lengthBytesUTF8\", \"stringToUTF8\"]'")
    set(LIBSOCKFS sockfs.js)
else()
    file(GLOB_RECURSE CMAKE_FILES **/CMakeFiles/*.c)
    list(REMOVE_ITEM ALL_FILES ${CMAKE_FILES})
    set(LIBFONTCONFIG ${LIB_DIR}/libfontconfig.a)
    set(LIBWEBPMUX ${LIB_DIR}/libwebpmux.a)
    set(LIBWEBPDEMUX ${LIB_DIR}/libwebpdemux.a)
endif()

if (PLATFORM STREQUAL "MACOS")
    set(LIBICONV /usr/local/opt/libiconv/lib/libiconv.a)

    set(STDCPLUSPLUS stdc++)
elseif (PLATFORM STREQUAL "WASM")
    list(APPEND ALL_FILES foo.cxx)
else()
    find_package(Threads REQUIRED)
    set(THREADLIB Threads::Threads)

    list(APPEND ALL_FILES foo.cxx)

    set(STDCPLUSPLUS -static-libstdc++ -static-libgcc)
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

    ${LIB_DIR}/libz.a
    ${LIBICONV}
    ${LIB_DIR}/libxml2.a
    ${LIBFONTCONFIG}
    ${LIB_DIR}/libfreetype.a
    ${LIB_DIR}/libpng.a
    ${LIB_DIR}/libturbojpeg.a
    ${LIB_DIR}/libtiff.a
    ${LIB_DIR}/libwebp.a
    ${LIBWEBPMUX}
    ${LIBWEBPDEMUX}
    ${LIB_DIR}/libopenjp2.a
    ${LIB_DIR}/liblcms2.a
    ${LIB_DIR}/libheif.a
    ${LIB_DIR}/libde265.a
    ${LIB_DIR}/libraw_r.a

    ${LIBSOCKFS}

    ${THREADLIB}

    ${STDCPLUSPLUS}
)