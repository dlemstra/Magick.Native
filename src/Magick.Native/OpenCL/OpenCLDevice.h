// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT MagickCLDeviceType OpenCLDevice_DeviceType_Get(const MagickCLDevice);

MAGICK_NATIVE_EXPORT double OpenCLDevice_BenchmarkScore_Get(const MagickCLDevice);

MAGICK_NATIVE_EXPORT MagickBooleanType OpenCLDevice_IsEnabled_Get(const MagickCLDevice);
MAGICK_NATIVE_EXPORT void OpenCLDevice_IsEnabled_Set(const MagickCLDevice, const MagickBooleanType);

MAGICK_NATIVE_EXPORT const char *OpenCLDevice_Name_Get(const MagickCLDevice);

MAGICK_NATIVE_EXPORT const char *OpenCLDevice_Version_Get(const MagickCLDevice);

MAGICK_NATIVE_EXPORT const KernelProfileRecord *OpenCLDevice_GetKernelProfileRecords(const MagickCLDevice, size_t *);

#if defined(MAGICK_NATIVE_WINDOWS)
#  pragma warning(disable : 5266)
#endif
MAGICK_NATIVE_EXPORT const KernelProfileRecord OpenCLDevice_GetKernelProfileRecord(const KernelProfileRecord *, const size_t);
#if defined(MAGICK_NATIVE_WINDOWS)
#  pragma warning(default : 5266)
#endif

MAGICK_NATIVE_EXPORT void OpenCLDevice_SetProfileKernels(const MagickCLDevice, const MagickBooleanType);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
