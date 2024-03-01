// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

#define MAGICK_NATIVE_GET_EXCEPTION \
  { \
    ExceptionInfo \
      *exceptionInfo; \
    exceptionInfo = AcquireExceptionInfo()

#define MAGICK_NATIVE_DESTROY_EXCEPTION \
  exceptionInfo = DestroyExceptionInfo(exceptionInfo); \
  }

#define MAGICK_NATIVE_RAISE_EXCEPTION(type, message) \
  ThrowException(exceptionInfo, type, message, (const char *) NULL); \
  *exception = exceptionInfo

#define MAGICK_NATIVE_SET_EXCEPTION \
  if (exceptionInfo->severity != UndefinedException) \
    *exception = exceptionInfo; \
  else \
    exceptionInfo = DestroyExceptionInfo(exceptionInfo); \
  }

MAGICK_NATIVE_EXPORT const char *MagickExceptionHelper_Description(const ExceptionInfo *);

MAGICK_NATIVE_EXPORT void MagickExceptionHelper_Dispose(ExceptionInfo *);

MAGICK_NATIVE_EXPORT const char *MagickExceptionHelper_Message(const ExceptionInfo *);

MAGICK_NATIVE_EXPORT const ExceptionInfo *MagickExceptionHelper_Related(const ExceptionInfo *, const size_t);

MAGICK_NATIVE_EXPORT size_t MagickExceptionHelper_RelatedCount(const ExceptionInfo *);

MAGICK_NATIVE_EXPORT ExceptionType MagickExceptionHelper_Severity(const ExceptionInfo *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
