// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickRectangle.h"

MAGICK_NATIVE_EXPORT RectangleInfo *MagickRectangle_Create(void)
{
  RectangleInfo
    *rectangle_info;

  rectangle_info = (RectangleInfo *) AcquireMagickMemory(sizeof(*rectangle_info));
  if (rectangle_info == (RectangleInfo *) NULL)
    return (RectangleInfo *) NULL;
  ResetMagickMemory(rectangle_info, 0, sizeof(*rectangle_info));
  return rectangle_info;
}

MAGICK_NATIVE_EXPORT void MagickRectangle_Dispose(RectangleInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT ssize_t MagickRectangle_X_Get(const RectangleInfo *instance)
{
  return instance->x;
}

MAGICK_NATIVE_EXPORT void MagickRectangle_X_Set(RectangleInfo *instance, const ssize_t value)
{
  instance->x = value;
}

MAGICK_NATIVE_EXPORT ssize_t MagickRectangle_Y_Get(const RectangleInfo *instance)
{
  return instance->y;
}

MAGICK_NATIVE_EXPORT void MagickRectangle_Y_Set(RectangleInfo *instance, const ssize_t value)
{
  instance->y = value;
}

MAGICK_NATIVE_EXPORT size_t MagickRectangle_Width_Get(const RectangleInfo *instance)
{
  return instance->width;
}

MAGICK_NATIVE_EXPORT void MagickRectangle_Width_Set(RectangleInfo *instance, const size_t value)
{
  instance->width = value;
}

MAGICK_NATIVE_EXPORT size_t MagickRectangle_Height_Get(const RectangleInfo *instance)
{
  return instance->height;
}

MAGICK_NATIVE_EXPORT void MagickRectangle_Height_Set(RectangleInfo *instance, const size_t value)
{
  instance->height = value;
}

MAGICK_NATIVE_EXPORT RectangleInfo *MagickRectangle_FromPageSize(const char *page_size)
{
  char
    *geometry;

  MagickStatusType
    flags;

  RectangleInfo
    *rectangle_info;

  rectangle_info = MagickRectangle_Create();
  if (rectangle_info == (RectangleInfo *) NULL)
    return (RectangleInfo *) NULL;
  geometry = GetPageGeometry(page_size);
  flags = ParseAbsoluteGeometry(geometry, rectangle_info);
  geometry = DestroyString(geometry);
  if (((flags & WidthValue) == 0) || ((flags & HeightValue) == 0))
  {
    MagickRectangle_Dispose(rectangle_info);
    return (RectangleInfo *) NULL;
  }
  return rectangle_info;
}
