// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickColor.h"
#include "MagickColorCollection.h"

MAGICK_NATIVE_EXPORT void MagickColorCollection_DisposeList(PixelInfo *list)
{
  RelinquishMagickMemory(list);
}

MAGICK_NATIVE_EXPORT PixelInfo *MagickColorCollection_GetInstance(const PixelInfo *list, const size_t index)
{
  return MagickColor_Clone(&list[index]);
}