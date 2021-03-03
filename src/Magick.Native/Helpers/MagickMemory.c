// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickMemory.h"

MAGICK_NATIVE_EXPORT void MagickMemory_Relinquish(void *value)
{
  RelinquishMagickMemory(value);
}