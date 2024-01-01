// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT double ChannelPerceptualHash_GetHclpHuPhash(const ChannelPerceptualHash *, const size_t);

MAGICK_NATIVE_EXPORT double ChannelPerceptualHash_GetSrgbHuPhash(const ChannelPerceptualHash *, const size_t);

MAGICK_NATIVE_EXPORT double ChannelPerceptualHash_GetHuPhash(const ChannelPerceptualHash *, const size_t, const size_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
