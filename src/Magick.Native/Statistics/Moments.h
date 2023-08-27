// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT void Moments_DisposeList(ChannelMoments *);

MAGICK_NATIVE_EXPORT const ChannelMoments *Moments_GetInstance(const ChannelMoments *, const size_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
