// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"

#if defined(MAGICK_NATIVE_LINUX)
#define GLIBC_SYMVER_VERSION "2.2.5"
#elif defined(MAGICK_NATIVE_LINUX_ARM64)
#define GLIBC_SYMVER_VERSION "2.17"
#endif

#if defined GLIBC_SYMVER_VERSION
asm(".symver old_powf, powf@GLIBC_"GLIBC_SYMVER_VERSION);
float old_powf(float base, float exponent);
float powf(float base, float exponent)
{
  return old_powf(base, exponent);
}

asm(".symver old_logf, logf@GLIBC_"GLIBC_SYMVER_VERSION);
float old_logf(float arg);
float logf(float arg)
{
  return old_logf(arg);
}

asm(".symver old_log2f, log2f@GLIBC_"GLIBC_SYMVER_VERSION);
float old_log2f(float arg);
float log2f(float arg)
{
  return old_log2f(arg);
}
#endif
