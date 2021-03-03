// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "PixelCollection.h"

#define ExportStart(type) \
  type \
    *result; \
  size_t \
    length; \
  length = width*height*strlen(mapping)*sizeof(type);

MAGICK_NATIVE_EXPORT CacheView *PixelCollection_Create(const Image *image, ExceptionInfo **exception)
{
  CacheView
    *result;

  MAGICK_NATIVE_GET_EXCEPTION;
  result = AcquireAuthenticCacheView(image, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return result;
}

MAGICK_NATIVE_EXPORT void PixelCollection_Dispose(CacheView *instance)
{
  DestroyCacheView(instance);
}

MAGICK_NATIVE_EXPORT const Quantum *PixelCollection_GetArea(const CacheView *instance, const size_t x, const size_t y, const size_t width, const size_t height, ExceptionInfo **exception)
{
  const Quantum
    *pixels;

  MAGICK_NATIVE_GET_EXCEPTION;
  pixels = GetCacheViewVirtualPixels(instance, x, y, width, height, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return pixels;
}

MAGICK_NATIVE_EXPORT void PixelCollection_SetArea(CacheView *instance, const size_t x, const size_t y, const size_t width, const size_t height, const Quantum *values, const size_t length, ExceptionInfo **exception)
{
  const Quantum
    *q;

  const Image
    *image;

  size_t
    remaining,
    r,
    row_size;

  Quantum
    *pixels;

  MAGICK_NATIVE_GET_EXCEPTION;
  image = GetCacheViewImage(instance);
  q = values;
  row_size = image->number_channels * width;
  for (r = 0; r < height; r++)
  {
    pixels = QueueCacheViewAuthenticPixels(instance, x, y + r, width, 1, exceptionInfo);
    if (pixels == (Quantum *)NULL)
      break;
    remaining = length - (row_size * r);
    memcpy(pixels, q, (row_size < remaining ? row_size : remaining) * sizeof(*pixels));
    if (SyncCacheViewAuthenticPixels(instance, exceptionInfo) == MagickFalse)
      break;
    if (row_size > remaining)
      break;
    q += row_size;
  }
  MAGICK_NATIVE_SET_EXCEPTION;
}

MAGICK_NATIVE_EXPORT unsigned char *PixelCollection_ToByteArray(const CacheView *instance, const size_t x, const size_t y, const size_t width, const size_t height, const char *mapping, ExceptionInfo **exception)
{
  ExportStart(unsigned char);
  result = AcquireMagickMemory(length);
  if (result == (unsigned char *) NULL)
    return result;
  MAGICK_NATIVE_GET_EXCEPTION;
  ExportImagePixels(GetCacheViewImage(instance), x, y, width, height, mapping, CharPixel, result, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return result;
}

MAGICK_NATIVE_EXPORT unsigned short *PixelCollection_ToShortArray(const CacheView *instance, const size_t x, const size_t y, const size_t width, const size_t height, const char *mapping, ExceptionInfo **exception)
{
  ExportStart(unsigned short);
  result = AcquireMagickMemory(length);
  if (result == (unsigned short *) NULL)
    return result;
  MAGICK_NATIVE_GET_EXCEPTION;
  ExportImagePixels(GetCacheViewImage(instance), x, y, width, height, mapping, ShortPixel, result, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return result;
}