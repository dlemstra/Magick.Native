// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "PrimaryInfo.h"

MAGICK_NATIVE_EXPORT PrimaryInfo *PrimaryInfo_Create(void)
{
  return AcquireMagickMemory(sizeof(PrimaryInfo));
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_Dispose(PrimaryInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT double PrimaryInfo_X_Get(const PrimaryInfo *instance)
{
  return instance->x;
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_X_Set(PrimaryInfo *instance, const double value)
{
  instance->x = value;
}

MAGICK_NATIVE_EXPORT double PrimaryInfo_Y_Get(const PrimaryInfo *instance)
{
  return instance->y;
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_Y_Set(PrimaryInfo *instance, const double value)
{
  instance->y = value;
}

MAGICK_NATIVE_EXPORT double PrimaryInfo_Z_Get(const PrimaryInfo *instance)
{
  return instance->z;
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_Z_Set(PrimaryInfo *instance, const double value)
{
  instance->z = value;
}