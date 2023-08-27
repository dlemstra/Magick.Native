// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT MagickCLDevice *OpenCL_GetDevices(size_t *);

MAGICK_NATIVE_EXPORT MagickCLDevice OpenCL_GetDevice(const MagickCLDevice *, const size_t);

MAGICK_NATIVE_EXPORT MagickBooleanType OpenCL_GetEnabled(void);

MAGICK_NATIVE_EXPORT MagickBooleanType OpenCL_SetEnabled(const MagickBooleanType);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
