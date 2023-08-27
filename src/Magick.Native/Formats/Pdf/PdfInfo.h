// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT size_t PdfInfo_PageCount(const char *, const char *password, ExceptionInfo **);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
