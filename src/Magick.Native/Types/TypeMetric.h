// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

MAGICK_NATIVE_EXPORT TypeMetric *TypeMetric_Create(void);

MAGICK_NATIVE_EXPORT void TypeMetric_Dispose(TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_Ascent_Get(const TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_Descent_Get(const TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_MaxHorizontalAdvance_Get(const TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_TextHeight_Get(const TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_TextWidth_Get(const TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_UnderlinePosition_Get(const TypeMetric *);

MAGICK_NATIVE_EXPORT const double TypeMetric_UnderlineThickness_Get(const TypeMetric *);
