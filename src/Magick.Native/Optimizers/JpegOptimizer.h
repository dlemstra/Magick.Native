// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT void JpegOptimizer_CompressFile(const char *, const char *, const MagickBooleanType, const MagickBooleanType, const MagickBooleanType, ExceptionInfo **exception);

MAGICK_NATIVE_EXPORT void JpegOptimizer_CompressStream(const CustomStreamHandler, const CustomStreamHandler, const MagickBooleanType, const MagickBooleanType, const MagickBooleanType, ExceptionInfo **exception);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
