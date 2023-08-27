// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT size_t StringInfo_Length_Get(const StringInfo *);

MAGICK_NATIVE_EXPORT const unsigned char *StringInfo_Datum_Get(const StringInfo *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
