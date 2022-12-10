// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"

#ifdef MAGICK_NATIVE_LINUX
asm(".symver old_powf, powf@GLIBC_2.2.5");
float old_powf(float base, float exponent);
float powf(float base, float exponent)
{
  return old_powf(base, exponent);
}

asm(".symver old_logf, logf@GLIBC_2.2.5");
float old_logf(float arg);
float logf(float arg)
{
  return old_logf(arg);
}

asm(".symver old_log2f, log2f@GLIBC_2.2.5");
float old_log2f(float arg);
float log2f(float arg)
{
  return old_log2f(arg);
}

#endif
