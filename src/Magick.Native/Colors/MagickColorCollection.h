// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT PixelInfo *MagickColorCollection_Create(const size_t);

MAGICK_NATIVE_EXPORT void MagickColorCollection_Dispose(PixelInfo *);

MAGICK_NATIVE_EXPORT PixelInfo *MagickColorCollection_Get(const PixelInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MagickColorCollection_Set(PixelInfo *, const size_t, const PixelInfo *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
