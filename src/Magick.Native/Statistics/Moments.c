// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Moments.h"

MAGICK_NATIVE_EXPORT void Moments_DisposeList(ChannelMoments *list)
{
  RelinquishMagickMemory(list);
}

MAGICK_NATIVE_EXPORT const ChannelMoments *Moments_GetInstance(const ChannelMoments *list, const size_t channel)
{
  return &list[(ChannelType)channel];
}