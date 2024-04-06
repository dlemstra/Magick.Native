// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#define _CRT_SECURE_NO_WARNINGS

#if defined(MAGICK_NATIVE_WINDOWS)
  #pragma warning(disable : 4505) // unreferenced function with internal linkage has been removed
#endif

#include <MagickCore/MagickCore.h>
#include <MagickCore/studio.h>
#include <MagickCore/utility-private.h>
#include <MagickCore/string-private.h>
#include <MagickCore/delegate-private.h>
#include <MagickWand/MagickWand.h>
#include <coders/ghostscript-private.h>

#if !defined(MAGICK_NATIVE_WINDOWS)
  #if defined(MAGICK_NATIVE_WASM)
    #include <emscripten.h>
    #define MAGICK_NATIVE_EXPORT EMSCRIPTEN_KEEPALIVE
  #else
    #define MAGICK_NATIVE_EXPORT __attribute__((visibility("default")))
  #endif
#else
  #define _LIB
  #define MAGICK_NATIVE_STRINGIFY(s) #s
  #if defined(_DEBUG)
    #define MAGICK_NATIVE_LINK_LIB(name) \
      __pragma(comment(lib, MAGICK_NATIVE_STRINGIFY(CORE_DB_##name##_.lib)))
  #else
    #define MAGICK_NATIVE_LINK_LIB(name) \
      __pragma(comment(lib, MAGICK_NATIVE_STRINGIFY(CORE_RL_##name##_.lib)))
  #endif
  #define MAGICK_NATIVE_EXPORT __declspec(dllexport)

  MAGICK_NATIVE_LINK_LIB(aom)
  MAGICK_NATIVE_LINK_LIB(brotli)
  MAGICK_NATIVE_LINK_LIB(bzlib)
  MAGICK_NATIVE_LINK_LIB(cairo)
  MAGICK_NATIVE_LINK_LIB(coders)
  MAGICK_NATIVE_LINK_LIB(croco)
  MAGICK_NATIVE_LINK_LIB(de265)
  MAGICK_NATIVE_LINK_LIB(deflate)
  MAGICK_NATIVE_LINK_LIB(exr)
  MAGICK_NATIVE_LINK_LIB(ffi)
  MAGICK_NATIVE_LINK_LIB(freetype)
  MAGICK_NATIVE_LINK_LIB(fribidi)
  MAGICK_NATIVE_LINK_LIB(glib)
  MAGICK_NATIVE_LINK_LIB(harfbuzz)
  MAGICK_NATIVE_LINK_LIB(heif)
  MAGICK_NATIVE_LINK_LIB(highway)
  MAGICK_NATIVE_LINK_LIB(jpeg-turbo)
  MAGICK_NATIVE_LINK_LIB(jpeg-xl)
  MAGICK_NATIVE_LINK_LIB(lcms)
  MAGICK_NATIVE_LINK_LIB(lqr)
  MAGICK_NATIVE_LINK_LIB(lzma)
  MAGICK_NATIVE_LINK_LIB(MagickCore)
  MAGICK_NATIVE_LINK_LIB(MagickWand)
  MAGICK_NATIVE_LINK_LIB(openjpeg)
  MAGICK_NATIVE_LINK_LIB(pango)
  MAGICK_NATIVE_LINK_LIB(pixman)
  MAGICK_NATIVE_LINK_LIB(png)
  MAGICK_NATIVE_LINK_LIB(raqm)
  MAGICK_NATIVE_LINK_LIB(raw)
  MAGICK_NATIVE_LINK_LIB(rsvg)
  MAGICK_NATIVE_LINK_LIB(tiff)
  MAGICK_NATIVE_LINK_LIB(xml)
  MAGICK_NATIVE_LINK_LIB(webp)
  MAGICK_NATIVE_LINK_LIB(zip)
  MAGICK_NATIVE_LINK_LIB(zlib)

  #pragma comment(lib, "ws2_32.lib")
  #pragma comment(lib, "urlmon.lib")

#endif

#include "Exceptions/MagickExceptionHelper.h"
