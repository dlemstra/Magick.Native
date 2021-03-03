// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Statistics.h"

MAGICK_NATIVE_EXPORT void Statistics_DisposeList(ChannelStatistics *list)
{
  RelinquishMagickMemory(list);
}

MAGICK_NATIVE_EXPORT const ChannelStatistics *Statistics_GetInstance(const ChannelStatistics *list, const size_t channel)
{
  return &list[(ChannelType)channel];
}