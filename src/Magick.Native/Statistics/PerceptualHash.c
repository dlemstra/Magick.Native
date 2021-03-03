// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "PerceptualHash.h"

MAGICK_NATIVE_EXPORT void PerceptualHash_DisposeList(ChannelPerceptualHash *list)
{
  RelinquishMagickMemory(list);
}

MAGICK_NATIVE_EXPORT const ChannelPerceptualHash *PerceptualHash_GetInstance(const Image *instance, const ChannelPerceptualHash *list, const size_t channel)
{
  if ((GetPixelChannelTraits(instance, (PixelChannel)channel) & UpdatePixelTrait) == 0)
    return (ChannelPerceptualHash *)NULL;

  return &list[(PixelChannel)channel];
}