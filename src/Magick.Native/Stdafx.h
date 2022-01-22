// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(MAGICK_NATIVE_WASM)
  #define MAGICK_NATIVE_LINUX
#endif

#define _CRT_SECURE_NO_WARNINGS

#include <MagickCore/MagickCore.h>
#include <MagickCore/studio.h>
#include <MagickCore/utility-private.h>
#include <MagickCore/string-private.h>
#include <MagickCore/delegate-private.h>
#include <MagickWand/MagickWand.h>
#include <coders/ghostscript-private.h>

#if defined(MAGICK_NATIVE_LINUX) || defined(MAGICK_NATIVE_MACOS)

#if defined(MAGICK_NATIVE_WASM)
  #include <emscripten.h>
  #define MAGICK_NATIVE_EXPORT EMSCRIPTEN_KEEPALIVE
#else
  #define MAGICK_NATIVE_EXPORT __attribute__((visibility("default")))
#endif

#else
#define _LIB

#pragma warning(disable : 4710)
#pragma warning(disable : 4711)

#define MAGICK_NATIVE_STRINGIFY(s) #s
#if defined(_DEBUG)
#define MAGICK_NATIVE_LINK_LIB(name) \
  __pragma(comment(lib,MAGICK_NATIVE_STRINGIFY(CORE_DB_##name##_.lib)))
#else
#define MAGICK_NATIVE_LINK_LIB(name) \
  __pragma(comment(lib,MAGICK_NATIVE_STRINGIFY(CORE_RL_##name##_.lib)))
#endif

#define MAGICK_NATIVE_EXPORT __declspec(dllexport)

#if defined(MAGICKCORE_BZLIB_DELEGATE)
MAGICK_NATIVE_LINK_LIB("bzlib")
#endif

MAGICK_NATIVE_LINK_LIB("coders")

#if defined(MAGICKCORE_OPENEXR_DELEGATE)
MAGICK_NATIVE_LINK_LIB("exr")
#endif

#if defined(MAGICKCORE_LQR_DELEGATE)
MAGICK_NATIVE_LINK_LIB("ffi")
#endif

#if defined(MAGICKCORE_FLIF_DELEGATE)
MAGICK_NATIVE_LINK_LIB("flif")
#endif

#if defined(MAGICKCORE_FREETYPE_DELEGATE)
MAGICK_NATIVE_LINK_LIB("freetype")
#endif

#if defined(MAGICKCORE_LQR_DELEGATE)
MAGICK_NATIVE_LINK_LIB("glib")
#pragma comment(lib, "winmm.lib")
#endif

#if defined(MAGICKCORE_LZMA_DELEGATE)
MAGICK_NATIVE_LINK_LIB("liblzma")
#endif

#if defined(MAGICKCORE_JBIG_DELEGATE)
MAGICK_NATIVE_LINK_LIB("jbig")
#endif

#if defined(MAGICKCORE_JP2_DELEGATE)
MAGICK_NATIVE_LINK_LIB("jp2")
#endif

#if defined(MAGICKCORE_JPEG_DELEGATE)
MAGICK_NATIVE_LINK_LIB("jpeg-turbo")
#endif

#if defined(MAGICKCORE_JXL_DELEGATE)
MAGICK_NATIVE_LINK_LIB("highway")
MAGICK_NATIVE_LINK_LIB("brotli")
MAGICK_NATIVE_LINK_LIB("jpeg-xl")
#endif

#if defined(MAGICKCORE_LCMS_DELEGATE)
MAGICK_NATIVE_LINK_LIB("lcms")
#endif

#if defined(MAGICKCORE_LIBOPENJP2_DELEGATE)
MAGICK_NATIVE_LINK_LIB("openjpeg")
#endif

#if defined(MAGICKCORE_HEIC_DELEGATE)
MAGICK_NATIVE_LINK_LIB("aom")
MAGICK_NATIVE_LINK_LIB("libde265")
MAGICK_NATIVE_LINK_LIB("libheif")
#endif

#if defined(MAGICKCORE_RAW_R_DELEGATE)
MAGICK_NATIVE_LINK_LIB("libraw")
#endif

MAGICK_NATIVE_LINK_LIB("libxml")

#if defined(MAGICKCORE_LQR_DELEGATE)
MAGICK_NATIVE_LINK_LIB("lqr")
#endif

MAGICK_NATIVE_LINK_LIB("MagickCore")
MAGICK_NATIVE_LINK_LIB("MagickWand")

#if defined(MAGICKCORE_CAIRO_DELEGATE)
MAGICK_NATIVE_LINK_LIB("cairo")
#endif

#if defined(MAGICKCORE_PANGOCAIRO_DELEGATE)
MAGICK_NATIVE_LINK_LIB("fribidi")
MAGICK_NATIVE_LINK_LIB("harfbuzz")
MAGICK_NATIVE_LINK_LIB("pango")
MAGICK_NATIVE_LINK_LIB("pixman")
#endif

#if defined(MAGICKCORE_PNG_DELEGATE)
MAGICK_NATIVE_LINK_LIB("png")
#endif

#if defined(MAGICKCORE_RAQM_DELEGATE)
MAGICK_NATIVE_LINK_LIB("raqm")
#endif

#if defined(MAGICKCORE_RSVG_DELEGATE)
MAGICK_NATIVE_LINK_LIB("croco")
MAGICK_NATIVE_LINK_LIB("librsvg")
#endif

#if defined(MAGICKCORE_TIFF_DELEGATE)
MAGICK_NATIVE_LINK_LIB("tiff")
#endif

#if defined(MAGICKCORE_WEBP_DELEGATE)
MAGICK_NATIVE_LINK_LIB("webp")
#endif

#if defined(MAGICKCORE_ZIP_DELEGATE)
MAGICK_NATIVE_LINK_LIB("libzip")
#endif

#if defined(MAGICKCORE_ZLIB_DELEGATE)
MAGICK_NATIVE_LINK_LIB("zlib")
#endif

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "urlmon.lib")
#endif

#include "Exceptions/MagickExceptionHelper.h"
