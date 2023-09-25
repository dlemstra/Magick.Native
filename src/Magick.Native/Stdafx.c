// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"

#if defined(MAGICK_NATIVE_LINUX)
#define GLIBC_SYMVER_VERSION "2.2.5"
#elif defined(MAGICK_NATIVE_LINUX_ARM64)
#define GLIBC_SYMVER_VERSION "2.17"
#endif

#if defined GLIBC_SYMVER_VERSION
#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

__asm__(".symver old_fcntl64, fcntl@GLIBC_" GLIBC_SYMVER_VERSION);
int old_fcntl64(int fd, int cmd, ...);
int fcntl64(int fd, int cmd, ...)
{
  va_list
    operands;

  va_start(operands, cmd);
  return old_fcntl64(fd, cmd, operands);
  va_end(operands);
}

__asm__(".symver old_exp, exp@GLIBC_" GLIBC_SYMVER_VERSION);
double old_exp(double arg);
double exp(double arg)
{
  return old_exp(arg);
}
__asm__(".symver old_exp2, exp2@GLIBC_" GLIBC_SYMVER_VERSION);
double old_exp2(double arg);
double exp2(double arg)
{
  return old_exp2(arg);
}

__asm__(".symver old_log, log@GLIBC_" GLIBC_SYMVER_VERSION);
double old_log(double arg);
double log(double arg)
{
  return old_log(arg);
}

__asm__(".symver old_log2, log2@GLIBC_" GLIBC_SYMVER_VERSION);
double old_log2(double arg);
double log2(double arg)
{
  return old_log2(arg);
}

__asm__(".symver old_logf, logf@GLIBC_" GLIBC_SYMVER_VERSION);
float old_logf(float arg);
float logf(float arg)
{
  return old_logf(arg);
}

__asm__(".symver old_log2f, log2f@GLIBC_" GLIBC_SYMVER_VERSION);
float old_log2f(float arg);
float log2f(float arg)
{
  return old_log2f(arg);
}

__asm__(".symver old_pow, pow@GLIBC_" GLIBC_SYMVER_VERSION);
double old_pow(double base, double exponent);
double pow(double base, double exponent)
{
  return old_pow(base, exponent);
}

__asm__(".symver old_powf, powf@GLIBC_" GLIBC_SYMVER_VERSION);
float old_powf(float base, float exponent);
float powf(float base, float exponent)
{
  return old_powf(base, exponent);
}
#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
#endif
