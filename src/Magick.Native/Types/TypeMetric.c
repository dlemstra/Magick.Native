// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "TypeMetric.h"

MAGICK_NATIVE_EXPORT TypeMetric *TypeMetric_Create(void)
{
  return AcquireMagickMemory(sizeof(TypeMetric));
}

MAGICK_NATIVE_EXPORT void TypeMetric_Dispose(TypeMetric *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT const double TypeMetric_Ascent_Get(const TypeMetric *instance)
{
  return instance->ascent;
}

MAGICK_NATIVE_EXPORT const double TypeMetric_Descent_Get(const TypeMetric *instance)
{
  return instance->descent;
}

MAGICK_NATIVE_EXPORT const double TypeMetric_MaxHorizontalAdvance_Get(const TypeMetric *instance)
{
  return instance->max_advance;
}

MAGICK_NATIVE_EXPORT const double TypeMetric_TextHeight_Get(const TypeMetric *instance)
{
  return instance->height;
}

MAGICK_NATIVE_EXPORT const double TypeMetric_TextWidth_Get(const TypeMetric *instance)
{
  return instance->width;
}

MAGICK_NATIVE_EXPORT const double TypeMetric_UnderlinePosition_Get(const TypeMetric *instance)
{
  return instance->underline_position;
}

MAGICK_NATIVE_EXPORT const double TypeMetric_UnderlineThickness_Get(const TypeMetric *instance)
{
  return instance->underline_thickness;
}