// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "StringInfo.h"

MAGICK_NATIVE_EXPORT size_t StringInfo_Length_Get(const StringInfo *instance)
{
  return instance->length;
}

MAGICK_NATIVE_EXPORT const unsigned char *StringInfo_Datum_Get(const StringInfo *instance)
{
  return (const unsigned char *)instance->datum;
}