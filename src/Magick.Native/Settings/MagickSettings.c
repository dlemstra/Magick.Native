// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickSettings.h"
#include "Colors/MagickColor.h"

MAGICK_NATIVE_EXPORT ImageInfo *MagickSettings_Create(void)
{
  return AcquireImageInfo();
}

MAGICK_NATIVE_EXPORT void MagickSettings_Dispose(ImageInfo *instance)
{
  DestroyImageInfo(instance);
}

MAGICK_NATIVE_EXPORT const MagickBooleanType MagickSettings_AntiAlias_Get(const ImageInfo *instance)
{
  return instance->antialias;
}

MAGICK_NATIVE_EXPORT void MagickSettings_AntiAlias_Set(ImageInfo *instance, const MagickBooleanType value)
{
  instance->antialias = value;
}

MAGICK_NATIVE_EXPORT PixelInfo *MagickSettings_BackgroundColor_Get(const ImageInfo *instance)
{
  return MagickColor_Clone(&instance->background_color);
}

MAGICK_NATIVE_EXPORT void MagickSettings_BackgroundColor_Set(ImageInfo *instance, const PixelInfo *value)
{
  if (value != (PixelInfo *) NULL)
    instance->background_color = *value;
}

MAGICK_NATIVE_EXPORT size_t MagickSettings_ColorSpace_Get(const ImageInfo *instance)
{
  return instance->colorspace;
}

MAGICK_NATIVE_EXPORT void MagickSettings_ColorSpace_Set(ImageInfo *instance, const size_t value)
{
  instance->colorspace = (ColorspaceType) value;
}

MAGICK_NATIVE_EXPORT size_t MagickSettings_ColorType_Get(const ImageInfo *instance)
{
  return instance->type;
}

MAGICK_NATIVE_EXPORT void MagickSettings_ColorType_Set(ImageInfo *instance, const size_t value)
{
  instance->type = (ImageType) value;
}

MAGICK_NATIVE_EXPORT size_t MagickSettings_Compression_Get(const ImageInfo *instance)
{
  return instance->compression;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Compression_Set(ImageInfo *instance, const size_t value)
{
  instance->compression = value;
}

MAGICK_NATIVE_EXPORT const MagickBooleanType MagickSettings_Debug_Get(const ImageInfo *instance)
{
  return instance->debug;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Debug_Set(ImageInfo *instance, const MagickBooleanType value)
{
  instance->debug = value;
}

MAGICK_NATIVE_EXPORT const char *MagickSettings_Density_Get(const ImageInfo *instance)
{
  return instance->density;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Density_Set(ImageInfo *instance, const char *value)
{
  CloneString(&instance->density, value);
}

MAGICK_NATIVE_EXPORT const size_t MagickSettings_Depth_Get(const ImageInfo *instance)
{
  return instance->depth;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Depth_Set(ImageInfo *instance, const size_t value)
{
  instance->depth = value;
}

MAGICK_NATIVE_EXPORT size_t MagickSettings_Endian_Get(const ImageInfo *instance)
{
  return instance->endian;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Endian_Set(ImageInfo *instance, const size_t value)
{
  instance->endian = value;
}

MAGICK_NATIVE_EXPORT const char *MagickSettings_Extract_Get(ImageInfo *instance)
{
  return instance->extract;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Extract_Set(ImageInfo *instance, const char *value)
{
  CloneString(&instance->extract, value);
}

MAGICK_NATIVE_EXPORT const char *MagickSettings_Format_Get(const ImageInfo *instance)
{
  if (*instance->magick == '\0')
    return (const char *) NULL;

  return (const char *) &(instance->magick);
}

MAGICK_NATIVE_EXPORT void MagickSettings_Format_Set(ImageInfo *instance, const char *value)
{
  if (value == (const char *) NULL)
    *instance->magick = '\0';
  else
    CopyMagickString(instance->magick, value, MaxTextExtent);
}

MAGICK_NATIVE_EXPORT const char *MagickSettings_Font_Get(const ImageInfo *instance)
{
  return instance->font;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Font_Set(ImageInfo *instance, const char *value)
{
  if (instance->font != (char *) NULL)
    instance->font = DestroyString(instance->font);
  if (value != (const char *) NULL)
    instance->font = ConstantString(value);
}

MAGICK_NATIVE_EXPORT const double MagickSettings_FontPointsize_Get(const ImageInfo *instance)
{
  return instance->pointsize;
}

MAGICK_NATIVE_EXPORT void MagickSettings_FontPointsize_Set(ImageInfo *instance, const double value)
{
  instance->pointsize = value;
}

MAGICK_NATIVE_EXPORT const size_t MagickSettings_Interlace_Get(const ImageInfo *instance)
{
  return (size_t) instance->interlace;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Interlace_Set(ImageInfo *instance, const size_t value)
{
  instance->interlace = (InterlaceType) value;
}

MAGICK_NATIVE_EXPORT const MagickBooleanType MagickSettings_Monochrome_Get(ImageInfo *instance)
{
  return instance->monochrome;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Monochrome_Set(ImageInfo *instance, const MagickBooleanType value)
{
  instance->monochrome = value;
}

MAGICK_NATIVE_EXPORT MagickBooleanType MagickSettings_Verbose_Get(const ImageInfo *instance)
{
  return instance->verbose;
}

MAGICK_NATIVE_EXPORT void MagickSettings_Verbose_Set(ImageInfo *instance, const MagickBooleanType value)
{
  instance->verbose = value;
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetColorFuzz(ImageInfo *instance, const double value)
{
  instance->fuzz = value;
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetFileName(ImageInfo *instance, const char *value)
{
  if (value == (const char *) NULL)
    *instance->filename = '\0';
  else
    CopyMagickString(instance->filename, value, MaxTextExtent);
  SetImageOption(instance, "filename", value);
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetNumberScenes(ImageInfo *instance, const size_t value)
{
  instance->number_scenes = value;
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetOption(ImageInfo *instance, const char *key, const char *value)
{
  SetImageOption(instance, key, value);
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetPage(ImageInfo *instance, const char *value)
{
  CloneString(&instance->page, value);
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetPing(ImageInfo *instance, const MagickBooleanType value)
{
  instance->ping = value;
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetQuality(ImageInfo *instance, const size_t value)
{
  instance->quality = value;
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetScenes(ImageInfo *instance, const char *value)
{
  CloneString(&instance->scenes, value);
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetScene(ImageInfo *instance, const size_t value)
{
  instance->scene = value;
}

MAGICK_NATIVE_EXPORT void MagickSettings_SetSize(ImageInfo *instance, const char *value)
{
  CloneString(&instance->size, value);
}