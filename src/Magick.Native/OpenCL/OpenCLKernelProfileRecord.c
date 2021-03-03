// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "OpenCLKernelProfileRecord.h"

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_Count_Get(const KernelProfileRecord record)
{
  return record->count;
}

MAGICK_NATIVE_EXPORT const char *OpenCLKernelProfileRecord_Name_Get(const KernelProfileRecord record)
{
  return record->kernel_name;
}

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_MaximumDuration_Get(const KernelProfileRecord record)
{
  return record->max;
}

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_MinimumDuration_Get(const KernelProfileRecord record)
{
  return record->min;
}

MAGICK_NATIVE_EXPORT unsigned long OpenCLKernelProfileRecord_TotalDuration_Get(const KernelProfileRecord record)
{
  return record->total;
}