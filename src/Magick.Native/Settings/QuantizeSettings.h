// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

MAGICK_NATIVE_EXPORT QuantizeInfo *QuantizeSettings_Create(void);

MAGICK_NATIVE_EXPORT void QuantizeSettings_Dispose(QuantizeInfo *);

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetColors(QuantizeInfo *, const size_t);

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetColorSpace(QuantizeInfo *, const size_t);

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetDitherMethod(QuantizeInfo *, const size_t);

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetMeasureErrors(QuantizeInfo *, const MagickBooleanType);

MAGICK_NATIVE_EXPORT void QuantizeSettings_SetTreeDepth(QuantizeInfo *, const size_t);