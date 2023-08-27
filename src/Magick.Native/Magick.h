// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT const char *Magick_Delegates_Get(void);

MAGICK_NATIVE_EXPORT const char *Magick_Features_Get(void);

MAGICK_NATIVE_EXPORT const char *Magick_ImageMagickVersion_Get(void);

MAGICK_NATIVE_EXPORT const TypeInfo **Magick_GetFonts(size_t *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT const char *Magick_GetFontFamily(const TypeInfo **, const size_t);

MAGICK_NATIVE_EXPORT const char *Magick_GetFontName(const TypeInfo **, const size_t);

MAGICK_NATIVE_EXPORT void Magick_DisposeFonts(TypeInfo **);

MAGICK_NATIVE_EXPORT void Magick_SetDefaultFontFile(const char *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void Magick_SetLogDelegate(const MagickLogMethod);

MAGICK_NATIVE_EXPORT void Magick_SetLogEvents(const char *);

MAGICK_NATIVE_EXPORT void Magick_SetRandomSeed(const unsigned long);

MAGICK_NATIVE_EXPORT MagickBooleanType Magick_SetOpenCLEnabled(const MagickBooleanType);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
