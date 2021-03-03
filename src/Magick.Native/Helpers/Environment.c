// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Environment.h"
#include <stdlib.h>

MAGICK_NATIVE_EXPORT void Environment_Initialize(void)
{
  MagickCoreGenesis((const char *)NULL, MagickFalse);
}

MAGICK_NATIVE_EXPORT void Environment_SetEnv(const char *name, const char *value)
{
#if defined(MAGICK_NATIVE_LINUX) || defined(MAGICK_NATIVE_MACOS)
  (void) setenv(name, value, 1);
#else
  _putenv_s(name, value);
#endif
}