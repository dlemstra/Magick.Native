// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Environment.h"
#include <stdlib.h>

MAGICK_NATIVE_EXPORT void Environment_Initialize(void)
{
  MagickCoreGenesis((const char *) NULL, MagickFalse);
}

MAGICK_NATIVE_EXPORT void Environment_SetEnv(const char *name, const char *value)
{
#if defined(MAGICK_NATIVE_WINDOWS)
  _putenv_s(name, value);
#else
  (void) setenv(name, value, 1);
#endif
}
