// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT PixelInfo *MagickColor_Create(void);

MAGICK_NATIVE_EXPORT void MagickColor_Dispose(PixelInfo *);

MAGICK_NATIVE_EXPORT MagickSizeType MagickColor_Count_Get(const PixelInfo *);

MAGICK_NATIVE_EXPORT Quantum MagickColor_Red_Get(const PixelInfo *);
MAGICK_NATIVE_EXPORT void MagickColor_Red_Set(PixelInfo *, const Quantum);

MAGICK_NATIVE_EXPORT Quantum MagickColor_Green_Get(const PixelInfo *);
MAGICK_NATIVE_EXPORT void MagickColor_Green_Set(PixelInfo *, const Quantum);

MAGICK_NATIVE_EXPORT Quantum MagickColor_Blue_Get(const PixelInfo *);
MAGICK_NATIVE_EXPORT void MagickColor_Blue_Set(PixelInfo *, const Quantum);

MAGICK_NATIVE_EXPORT Quantum MagickColor_Alpha_Get(const PixelInfo *);
MAGICK_NATIVE_EXPORT void MagickColor_Alpha_Set(PixelInfo *, const Quantum);

MAGICK_NATIVE_EXPORT Quantum MagickColor_Black_Get(const PixelInfo *);
MAGICK_NATIVE_EXPORT void MagickColor_Black_Set(PixelInfo *, const Quantum);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickColor_IsCMYK_Get(const PixelInfo *);
MAGICK_NATIVE_EXPORT void MagickColor_IsCMYK_Set(PixelInfo *, MagickBooleanType);

MAGICK_NATIVE_EXPORT PixelInfo *MagickColor_Clone(const PixelInfo *);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickColor_FuzzyEquals(const PixelInfo *, const PixelInfo *, const Quantum);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickColor_Initialize(PixelInfo *, const char *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
