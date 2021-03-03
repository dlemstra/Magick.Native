// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

MAGICK_NATIVE_EXPORT OffsetInfo *OffsetInfo_Create(void);

MAGICK_NATIVE_EXPORT void OffsetInfo_Dispose(OffsetInfo *);

MAGICK_NATIVE_EXPORT void OffsettInfo_SetX(OffsetInfo *, const size_t);

MAGICK_NATIVE_EXPORT void OffsetInfo_SetY(OffsetInfo *, const size_t);