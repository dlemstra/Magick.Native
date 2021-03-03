// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

MAGICK_NATIVE_EXPORT void PerceptualHash_DisposeList(ChannelPerceptualHash *);

MAGICK_NATIVE_EXPORT const ChannelPerceptualHash *PerceptualHash_GetInstance(const Image *, const ChannelPerceptualHash *, const size_t);
