// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "OffsetInfo.h"

MAGICK_NATIVE_EXPORT OffsetInfo *OffsetInfo_Create(void)
{
  return (OffsetInfo *) AcquireMagickMemory(sizeof(OffsetInfo));
}

MAGICK_NATIVE_EXPORT void OffsetInfo_Dispose(OffsetInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT void OffsetInfo_SetX(OffsetInfo *instance, const ssize_t value)
{
  instance->x = value;
}

MAGICK_NATIVE_EXPORT void OffsetInfo_SetY(OffsetInfo *instance, const ssize_t value)
{
  instance->y = value;
}
