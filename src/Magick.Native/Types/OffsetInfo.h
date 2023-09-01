// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT OffsetInfo *OffsetInfo_Create(void);

MAGICK_NATIVE_EXPORT void OffsetInfo_Dispose(OffsetInfo *);

MAGICK_NATIVE_EXPORT void OffsetInfo_SetX(OffsetInfo *, const ssize_t);

MAGICK_NATIVE_EXPORT void OffsetInfo_SetY(OffsetInfo *, const ssize_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
