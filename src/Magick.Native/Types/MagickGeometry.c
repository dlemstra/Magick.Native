// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickGeometry.h"

MAGICK_NATIVE_EXPORT GeometryInfo *MagickGeometry_Create(void)
{
  GeometryInfo
    *geometry_info;

  geometry_info = (GeometryInfo *)AcquireMagickMemory(sizeof(*geometry_info));
  if (geometry_info == (GeometryInfo *)NULL)
    return (GeometryInfo *)NULL;
  ResetMagickMemory(geometry_info, 0, sizeof(*geometry_info));
  return geometry_info;
}

MAGICK_NATIVE_EXPORT void MagickGeometry_Dispose(GeometryInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT double MagickGeometry_X_Get(const GeometryInfo *instance)
{
  return instance->xi;
}

MAGICK_NATIVE_EXPORT double MagickGeometry_Y_Get(const GeometryInfo *instance)
{
  return instance->psi;
}

MAGICK_NATIVE_EXPORT double MagickGeometry_Width_Get(const GeometryInfo *instance)
{
  return instance->rho;
}

MAGICK_NATIVE_EXPORT double MagickGeometry_Height_Get(const GeometryInfo *instance)
{
  return instance->sigma;
}

MAGICK_NATIVE_EXPORT MagickStatusType MagickGeometry_Initialize(GeometryInfo *instance, const char *geometry)
{
  return ParseGeometry(geometry, instance);
}