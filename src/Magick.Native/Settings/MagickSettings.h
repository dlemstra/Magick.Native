// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT ImageInfo *MagickSettings_Create(void);

MAGICK_NATIVE_EXPORT void MagickSettings_Dispose(ImageInfo *);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickSettings_AntiAlias_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_AntiAlias_Set(ImageInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT PixelInfo *MagickSettings_BackgroundColor_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_BackgroundColor_Set(ImageInfo *, const PixelInfo *);

MAGICK_NATIVE_EXPORT size_t MagickSettings_ColorSpace_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_ColorSpace_Set(ImageInfo *, const size_t value);

MAGICK_NATIVE_EXPORT size_t MagickSettings_ColorType_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_ColorType_Set(ImageInfo *, const size_t value);

MAGICK_NATIVE_EXPORT size_t MagickSettings_Compression_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Compression_Set(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickSettings_Debug_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Debug_Set(ImageInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT const char *MagickSettings_Density_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Density_Set(ImageInfo *, const char *);

MAGICK_NATIVE_EXPORT size_t MagickSettings_Depth_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Depth_Set(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT size_t MagickSettings_Endian_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Endian_Set(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT const char *MagickSettings_Extract_Get(ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Extract_Set(ImageInfo *, const char *);

MAGICK_NATIVE_EXPORT const char *MagickSettings_Format_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Format_Set(ImageInfo *, const char *);

MAGICK_NATIVE_EXPORT double MagickSettings_FontPointsize_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_FontPointsize_Set(ImageInfo *, const double);

MAGICK_NATIVE_EXPORT size_t MagickSettings_Interlace_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Interlace_Set(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickSettings_Monochrome_Get(ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Monochrome_Set(ImageInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickSettings_Verbose_Get(const ImageInfo *);
MAGICK_NATIVE_EXPORT void MagickSettings_Verbose_Set(ImageInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT void MagickSettings_SetColorFuzz(ImageInfo *, const double);

MAGICK_NATIVE_EXPORT void MagickSettings_SetFileName(ImageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MagickSettings_SetFont(ImageInfo *instance, const char *value);

MAGICK_NATIVE_EXPORT void MagickSettings_SetInterlace(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MagickSettings_SetNumberScenes(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MagickSettings_SetOption(ImageInfo *, const char *, const char *);

MAGICK_NATIVE_EXPORT void MagickSettings_SetPage(ImageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MagickSettings_SetPing(ImageInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT void MagickSettings_SetQuality(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MagickSettings_SetScenes(ImageInfo *, const char *);

MAGICK_NATIVE_EXPORT void MagickSettings_SetScene(ImageInfo *, const size_t);

MAGICK_NATIVE_EXPORT void MagickSettings_SetSize(ImageInfo *, const char *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
