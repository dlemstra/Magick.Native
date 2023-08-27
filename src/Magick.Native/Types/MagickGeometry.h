// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT GeometryInfo *MagickGeometry_Create(void);

MAGICK_NATIVE_EXPORT void MagickGeometry_Dispose(GeometryInfo *);

MAGICK_NATIVE_EXPORT double MagickGeometry_X_Get(const GeometryInfo *);

MAGICK_NATIVE_EXPORT double MagickGeometry_Y_Get(const GeometryInfo *);

MAGICK_NATIVE_EXPORT double MagickGeometry_Width_Get(const GeometryInfo *);

MAGICK_NATIVE_EXPORT double MagickGeometry_Height_Get(const GeometryInfo *);

MAGICK_NATIVE_EXPORT MagickStatusType MagickGeometry_Initialize(GeometryInfo *, const char *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
