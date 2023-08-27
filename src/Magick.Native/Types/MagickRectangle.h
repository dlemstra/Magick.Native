// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT RectangleInfo *MagickRectangle_Create(void);

MAGICK_NATIVE_EXPORT void MagickRectangle_Dispose(RectangleInfo *);

MAGICK_NATIVE_EXPORT ssize_t MagickRectangle_X_Get(const RectangleInfo *);
MAGICK_NATIVE_EXPORT void MagickRectangle_X_Set(RectangleInfo *, const ssize_t);

MAGICK_NATIVE_EXPORT ssize_t MagickRectangle_Y_Get(const RectangleInfo *);
MAGICK_NATIVE_EXPORT void MagickRectangle_Y_Set(RectangleInfo *, const ssize_t);

MAGICK_NATIVE_EXPORT size_t MagickRectangle_Width_Get(const RectangleInfo *);
MAGICK_NATIVE_EXPORT void MagickRectangle_Width_Set(RectangleInfo *, const size_t);

MAGICK_NATIVE_EXPORT size_t MagickRectangle_Height_Get(const RectangleInfo *);
MAGICK_NATIVE_EXPORT void MagickRectangle_Height_Set(RectangleInfo *, const size_t);

MAGICK_NATIVE_EXPORT RectangleInfo *MagickRectangle_FromPageSize(const char *page_size);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
