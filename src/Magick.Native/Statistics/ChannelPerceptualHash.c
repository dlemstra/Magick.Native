// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "ChannelPerceptualHash.h"

MAGICK_NATIVE_EXPORT const double ChannelPerceptualHash_GetHclpHuPhash(const ChannelPerceptualHash *instance, const size_t index)
{
  return instance->phash[1][index];
}

MAGICK_NATIVE_EXPORT const double ChannelPerceptualHash_GetSrgbHuPhash(const ChannelPerceptualHash *instance, const size_t index)
{
  return instance->phash[0][index];
}