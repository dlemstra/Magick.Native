// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT KernelInfo *DoubleMatrix_Create(const double *, const size_t);

MAGICK_NATIVE_EXPORT void DoubleMatrix_Dispose(KernelInfo *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
