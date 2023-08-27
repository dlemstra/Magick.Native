// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT MontageInfo *MontageSettings_Create(void);

MAGICK_NATIVE_EXPORT void MontageSettings_Dispose(MontageInfo *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetBackgroundColor(MontageInfo *, const PixelInfo *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetBorderColor(MontageInfo *, const PixelInfo *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetBorderWidth(MontageInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MontageSettings_SetFillColor(MontageInfo *, const PixelInfo *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetFont(MontageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetFontPointsize(MontageInfo *, double);

MAGICK_NATIVE_EXPORT void MontageSettings_SetFrameGeometry(MontageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetGeometry(MontageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetGravity(MontageInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MontageSettings_SetShadow(MontageInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT void MontageSettings_SetStrokeColor(MontageInfo *, const PixelInfo *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetTextureFileName(MontageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetTileGeometry(MontageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MontageSettings_SetTitle(MontageInfo *, const char *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
