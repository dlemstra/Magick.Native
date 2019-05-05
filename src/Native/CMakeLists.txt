cmake_minimum_required (VERSION 2.8.8)

project(${LIBRARY_NAME})

add_definitions(-DMAGICK_NET_${PLATFORM} -DMAGICKCORE_QUANTUM_DEPTH=${DEPTH} -DMAGICKCORE_HDRI_ENABLE=${HDRI_ENABLE})

include_directories(.)
include_directories(/usr/local/include/ImageMagick-7/)

find_library(MAGICKCORE libMagickCore-7.${QUANTUM_NAME}.a)
find_library(MAGICKWAND libMagickWand-7.${QUANTUM_NAME}.a)

find_library(LIBZ libz.a)

file(GLOB_RECURSE ALL_FILES . *.c)
file(GLOB_RECURSE CMAKE_FILES **/CMakeFiles/*.c)
list(REMOVE_ITEM ALL_FILES ${CMAKE_FILES})

if (APPLE)
    find_library(LIBICONV NAMES libiconv.a PATHS /usr/local/opt/libiconv/lib)

    set(STDCPLUSPLUS stdc++)
else()
    find_package(Threads REQUIRED)
    set(THREADLIB Threads::Threads)

    list(APPEND ALL_FILES foo.cxx)

    set(STDCPLUSPLUS -static-libstdc++ -static-libgcc)
endif()

add_library(${LIBRARY_NAME} SHARED ${ALL_FILES})

target_link_libraries(
    ${LIBRARY_NAME}

    ${MAGICKWAND}
    ${MAGICKCORE}

    ${LIBZ}

    ${THREADLIB}

    ${LIBICONV}

    ${STDCPLUSPLUS}
)