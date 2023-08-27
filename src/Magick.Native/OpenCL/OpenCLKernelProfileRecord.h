// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_Count_Get(const KernelProfileRecord);

MAGICK_NATIVE_EXPORT const char *OpenCLKernelProfileRecord_Name_Get(const KernelProfileRecord);

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_MaximumDuration_Get(const KernelProfileRecord);

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_MinimumDuration_Get(const KernelProfileRecord);

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_TotalDuration_Get(const KernelProfileRecord);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
