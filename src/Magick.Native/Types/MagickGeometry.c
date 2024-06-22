// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickGeometry.h"
#include "MagickCore/image-private.h"

MAGICK_NATIVE_EXPORT GeometryInfo *MagickGeometry_Create(void)
{
  GeometryInfo
    *geometry_info;

  geometry_info = (GeometryInfo *) AcquireMagickMemory(sizeof(*geometry_info));
  if (geometry_info == (GeometryInfo *) NULL)
    return (GeometryInfo *) NULL;
  ResetMagickMemory(geometry_info, 0, sizeof(*geometry_info));
  return geometry_info;
}

MAGICK_NATIVE_EXPORT void MagickGeometry_Dispose(GeometryInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT ssize_t MagickGeometry_X_Get(const GeometryInfo *instance)
{
  return CastDoubleToLong(instance->xi);
}

MAGICK_NATIVE_EXPORT ssize_t MagickGeometry_Y_Get(const GeometryInfo *instance)
{
  return CastDoubleToLong(instance->psi);
}

MAGICK_NATIVE_EXPORT size_t MagickGeometry_Width_Get(const GeometryInfo *instance)
{
  return CastDoubleToUnsigned(instance->rho);
}

MAGICK_NATIVE_EXPORT size_t MagickGeometry_Height_Get(const GeometryInfo *instance)
{
  return CastDoubleToUnsigned(instance->sigma);
}

MAGICK_NATIVE_EXPORT MagickStatusType MagickGeometry_Initialize(GeometryInfo *instance, const char *geometry)
{
  return ParseGeometry(geometry, instance);
}
