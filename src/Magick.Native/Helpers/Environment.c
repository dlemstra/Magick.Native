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
#if defined(MAGICK_NATIVE_WINDOWS)
  char
    *value;

  size_t
    count;

  wchar_t
    *wide_name,
    *wide_value;

  wide_name = create_wchar_string(name);
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
