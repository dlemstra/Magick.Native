// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT PointInfo *PointInfoCollection_Create(const size_t);

MAGICK_NATIVE_EXPORT void PointInfoCollection_Dispose(PointInfo *);

MAGICK_NATIVE_EXPORT double PointInfoCollection_GetX(PointInfo *, const size_t);

MAGICK_NATIVE_EXPORT double PointInfoCollection_GetY(PointInfo *, const size_t);

MAGICK_NATIVE_EXPORT void PointInfoCollection_Set(PointInfo *, const size_t, const double, const double);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
