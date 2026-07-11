// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickColor.h"
#include "MagickColorCollection.h"

MAGICK_NATIVE_EXPORT PixelInfo *MagickColorCollection_Create(const size_t length)
{
  return (PixelInfo *) AcquireQuantumMemory(length, sizeof(PixelInfo));
}

MAGICK_NATIVE_EXPORT void MagickColorCollection_Dispose(PixelInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT PixelInfo *MagickColorCollection_Get(const PixelInfo *instance, const size_t index)
{
  return MagickColor_Clone(&instance[index]);
}

MAGICK_NATIVE_EXPORT void MagickColorCollection_Set(PixelInfo *instance, const size_t index, const PixelInfo *value)
{
  instance[index] = *value;
}
