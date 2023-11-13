// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Environment.h"
#include <stdlib.h>

#if defined(MAGICK_NATIVE_WINDOWS)
static inline wchar_t *create_wchar_string(const char *utf8)
{
  int
    count;

  wchar_t
    *wide;

  count = MultiByteToWideChar(CP_UTF8, 0, utf8, -1, NULL, 0);
  if (count == 0)
    return (wchar_t *) NULL;
  wide = (wchar_t *) NTAcquireQuantumMemory((size_t) count, sizeof(*wide));
  if (wide != (wchar_t *) NULL && MultiByteToWideChar(CP_UTF8, 0, utf8, -1, wide, count) == 0)
    wide = (wchar_t *) RelinquishMagickMemory(wide);
  return wide;
}
#endif

MAGICK_NATIVE_EXPORT void Environment_Initialize(void)
{
  MagickCoreGenesis((const char *) NULL, MagickFalse);
}

MAGICK_NATIVE_EXPORT char *Environment_GetEnv(const char *name)
{
  return GetEnvironmentValue(name);
}

MAGICK_NATIVE_EXPORT void Environment_SetEnv(const char *name, const char *value)
{
#if defined(MAGICK_NATIVE_WINDOWS)
  wchar_t
    *wide_name,
    *wide_value;

  wide_name = create_wchar_string(name);
  wide_value = create_wchar_string(value);
  if (wide_name != (wchar_t *) NULL && wide_value != (wchar_t *) NULL)
    _wputenv_s(wide_name, wide_value);
  wide_name = (wchar_t *) RelinquishMagickMemory(wide_name);
  wide_value = (wchar_t *) RelinquishMagickMemory(wide_value);
#else
  (void) setenv(name, value, 1);
#endif
}
