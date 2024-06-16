// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "QuantizeSettings.h"

MAGICK_NATIVE_EXPORT QuantizeInfo *QuantizeSettings_Create(void)
{
  return AcquireQuantizeInfo((const ImageInfo *) NULL);
}

MAGICK_NATIVE_EXPORT void QuantizeSettings_Dispose(QuantizeInfo *instance)
{
  DestroyQuantizeInfo(instance);
}

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetColors(QuantizeInfo *instance, const size_t value)
{
  instance->number_colors = value;
}

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetColorSpace(QuantizeInfo *instance, const ColorspaceType value)
{
  instance->colorspace = value;
}

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetDitherMethod(QuantizeInfo *instance, const DitherMethod value)
{
  instance->dither_method = value;
}

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetMeasureErrors(QuantizeInfo *instance, const MagickBooleanType value)
{
  instance->measure_error = value;
}

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetTreeDepth(QuantizeInfo *instance, const size_t value)
{
  instance->tree_depth = value;
}
