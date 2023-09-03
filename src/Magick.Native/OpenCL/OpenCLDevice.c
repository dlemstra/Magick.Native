// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "OpenCLDevice.h"

MAGICK_NATIVE_EXPORT MagickCLDeviceType OpenCLDevice_DeviceType_Get(const MagickCLDevice device)
{
  return GetOpenCLDeviceType(device);
}

MAGICK_NATIVE_EXPORT double OpenCLDevice_BenchmarkScore_Get(const MagickCLDevice device)
{
  return GetOpenCLDeviceBenchmarkScore(device);
}

MAGICK_NATIVE_EXPORT MagickBooleanType OpenCLDevice_IsEnabled_Get(const MagickCLDevice device)
{
  return GetOpenCLDeviceEnabled(device);
}

MAGICK_NATIVE_EXPORT void OpenCLDevice_IsEnabled_Set(const MagickCLDevice device, const MagickBooleanType value)
{
  SetOpenCLDeviceEnabled(device, value);
}

MAGICK_NATIVE_EXPORT const char *OpenCLDevice_Name_Get(const MagickCLDevice device)
{
  return GetOpenCLDeviceName(device);
}

MAGICK_NATIVE_EXPORT const char *OpenCLDevice_Version_Get(const MagickCLDevice device)
{
  return GetOpenCLDeviceVersion(device);
}

MAGICK_NATIVE_EXPORT const KernelProfileRecord *OpenCLDevice_GetKernelProfileRecords(const MagickCLDevice device, size_t *length)
{
  return GetOpenCLKernelProfileRecords(device, length);
}

#if defined(MAGICK_NATIVE_WINDOWS)
#  pragma warning(disable : 5266)
#endif
MAGICK_NATIVE_EXPORT const KernelProfileRecord OpenCLDevice_GetKernelProfileRecord(const KernelProfileRecord *records, const size_t index)
#if defined(MAGICK_NATIVE_WINDOWS)
#  pragma warning(default : 5266)
#endif
{
  return records[index];
}

MAGICK_NATIVE_EXPORT void OpenCLDevice_SetProfileKernels(const MagickCLDevice device, const MagickBooleanType value)
{
  SetOpenCLKernelProfileEnabled(device, value);
}
