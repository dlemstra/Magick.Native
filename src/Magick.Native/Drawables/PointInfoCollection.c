// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "PointInfoCollection.h"

MAGICK_NATIVE_EXPORT PointInfo *PointInfoCollection_Create(const size_t length)
{
  return (PointInfo *) AcquireMagickMemory(sizeof(PointInfo) * length);
}

MAGICK_NATIVE_EXPORT void PointInfoCollection_Dispose(PointInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT double PointInfoCollection_GetX(PointInfo *instance, const size_t index)
{
  return instance[index].x;
}

MAGICK_NATIVE_EXPORT double PointInfoCollection_GetY(PointInfo *instance, const size_t index)
{
  return instance[index].y;
}

MAGICK_NATIVE_EXPORT void PointInfoCollection_Set(PointInfo *instance, const size_t index, const double x, const double y)
{
  instance[index].x = x;
  instance[index].y = y;
}