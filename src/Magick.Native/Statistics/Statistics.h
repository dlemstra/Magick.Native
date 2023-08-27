// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT void Statistics_DisposeList(ChannelStatistics *);

MAGICK_NATIVE_EXPORT const ChannelStatistics *Statistics_GetInstance(const ChannelStatistics *, const size_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
