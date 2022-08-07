// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Environment.h"
#include <stdlib.h>

MAGICK_NATIVE_EXPORT void Environment_Initialize(void)
{
  MagickCoreGenesis((const char *) NULL, MagickFalse);
}

MAGICK_NATIVE_EXPORT char *Environment_GetEnv(const char *name)
{
#if defined(MAGICK_NATIVE_WINDOWS)
  char
    *value;

  size_t
    count;

  wchar_t
    *wide_name,
    *wide_value;

  count = (size_t) MultiByteToWideChar(CP_UTF8, 0, name, -1, NULL, 0);
  if (count <= 0)
    return (char *) NULL;
  wide_name = (wchar_t *) AcquireQuantumMemory(count, sizeof(*wide_name));
  if (wide_name == (wchar_t *) NULL)
    return (char *) NULL;
  (void) _wgetenv_s(&count, NULL, 0, wide_name);
  if (count <= 0)
  {
    wide_name = (wchar_t *) RelinquishMagickMemory(wide_name);
    return (char *) NULL;
  }
  wide_value = (wchar_t *) AcquireQuantumMemory(count, sizeof(*wide_value));
  if (wide_value == (wchar_t *) NULL)
  {
    wide_name = (wchar_t *) RelinquishMagickMemory(wide_name);
    return (char *) NULL;
  }
  (void) _wgetenv_s(&count, wide_value, count, wide_name);
  wide_name = (wchar_t *) RelinquishMagickMemory(wide_name);
  count = (size_t) WideCharToMultiByte(CP_UTF8, 0, wide_value, -1, NULL, 0, NULL, NULL);
  if (count <= 0)
  {
    wide_value = (wchar_t *) RelinquishMagickMemory(wide_value);
    return (char *) NULL;
  }
  value = (char *) AcquireQuantumMemory(count, sizeof(*value));
  if (value == (char *) NULL)
    return (char *) NULL;
  count = (size_t) WideCharToMultiByte(CP_UTF8, 0, wide_value, -1, value, (int) count, NULL, NULL);
  wide_value = (wchar_t *) RelinquishMagickMemory(wide_value);
  if (count == 0)
    value = (char *) RelinquishMagickMemory(value);
  return value;
#else
  return getenv(name);
#endif
}

MAGICK_NATIVE_EXPORT void Environment_SetEnv(const char *name, const char *value)
{
#if defined(MAGICK_NATIVE_WINDOWS)
  _putenv_s(name, value);
#else
  (void) setenv(name, value, 1);
#endif
}
