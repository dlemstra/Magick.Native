// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MontageSettings.h"

MAGICK_NATIVE_EXPORT MontageInfo *MontageSettings_Create(void)
{
  MontageInfo
    *montage_info;

  ImageInfo
    *image_info;

  image_info=AcquireImageInfo();
  montage_info = AcquireMagickMemory(sizeof(*montage_info));
  GetMontageInfo(image_info, montage_info);
  DestroyImageInfo(image_info);
  return montage_info;
}

MAGICK_NATIVE_EXPORT void MontageSettings_Dispose(MontageInfo *instance)
{
  DestroyMontageInfo(instance);
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetBackgroundColor(MontageInfo *instance, const PixelInfo *value)
{
  if (value != (PixelInfo*)NULL)
    instance->background_color = *value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetBorderColor(MontageInfo *instance, const PixelInfo *value)
{
  if (value != (PixelInfo*)NULL)
    instance->border_color = *value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetBorderWidth(MontageInfo *instance, const size_t value)
{
  instance->border_width = value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetFillColor(MontageInfo *instance, const PixelInfo *value)
{
  if (value != (PixelInfo*)NULL)
    instance->fill = *value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetFont(MontageInfo *instance, const char *value)
{
  CloneString(&instance->font, value);
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetFontPointsize(MontageInfo *instance, double value)
{
  instance->pointsize = value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetFrameGeometry(MontageInfo *instance, const char *value)
{
  CloneString(&instance->frame, value);
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetGeometry(MontageInfo *instance, const char *value)
{
  CloneString(&instance->geometry, value);
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetGravity(MontageInfo *instance, const size_t value)
{
  instance->gravity = (GravityType)value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetShadow(MontageInfo *instance, const MagickBooleanType value)
{
  instance->shadow = value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetStrokeColor(MontageInfo *instance, const PixelInfo *value)
{
  if (value != (PixelInfo*)NULL)
    instance->stroke = *value;
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetTextureFileName(MontageInfo *instance, const char *value)
{
  CloneString(&instance->texture, value);
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetTileGeometry(MontageInfo *instance, const char *value)
{
  CloneString(&instance->tile, value);
}

MAGICK_NATIVE_EXPORT void MontageSettings_SetTitle(MontageInfo *instance, const char *value)
{
  CloneString(&instance->title, value);
}