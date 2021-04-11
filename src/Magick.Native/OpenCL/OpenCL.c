// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "OpenCL.h"

MAGICK_NATIVE_EXPORT MagickCLDevice *OpenCL_GetDevices(size_t *length)
{
  MagickCLDevice
    *devices;

  MAGICK_NATIVE_GET_EXCEPTION;
  devices = GetOpenCLDevices(length, exceptionInfo);
  MAGICK_NATIVE_DESTROY_EXCEPTION;
  return devices;
}

MAGICK_NATIVE_EXPORT MagickCLDevice OpenCL_GetDevice(const MagickCLDevice *devices, const size_t index)
{
  return devices[index];
}

MAGICK_NATIVE_EXPORT MagickBooleanType OpenCL_GetEnabled(void)
{
  return GetOpenCLEnabled();
}

MAGICK_NATIVE_EXPORT MagickBooleanType OpenCL_SetEnabled(const MagickBooleanType value)
{
  return SetOpenCLEnabled(value);
}