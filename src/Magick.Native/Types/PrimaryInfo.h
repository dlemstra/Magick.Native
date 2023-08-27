// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT PrimaryInfo *PrimaryInfo_Create(void);

MAGICK_NATIVE_EXPORT void PrimaryInfo_Dispose(PrimaryInfo *);

MAGICK_NATIVE_EXPORT double PrimaryInfo_X_Get(const PrimaryInfo *);
MAGICK_NATIVE_EXPORT void PrimaryInfo_X_Set(PrimaryInfo *, const double);

MAGICK_NATIVE_EXPORT double PrimaryInfo_Y_Get(const PrimaryInfo *);
MAGICK_NATIVE_EXPORT void PrimaryInfo_Y_Set(PrimaryInfo *, const double);

MAGICK_NATIVE_EXPORT double PrimaryInfo_Z_Get(const PrimaryInfo *);
MAGICK_NATIVE_EXPORT void PrimaryInfo_Z_Set(PrimaryInfo *, const double);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
