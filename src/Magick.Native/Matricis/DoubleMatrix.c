// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "DoubleMatrix.h"

MAGICK_NATIVE_EXPORT KernelInfo *DoubleMatrix_Create(const double *values, const size_t order)
{
  KernelInfo
    *kernel;

  ssize_t
    i;

  MAGICK_NATIVE_GET_EXCEPTION;
  kernel = AcquireKernelInfo((const char *)NULL, exceptionInfo);
  MAGICK_NATIVE_DESTROY_EXCEPTION;

  if (kernel == (KernelInfo *)NULL)
    return (KernelInfo *)NULL;

  kernel->width = order;
  kernel->height = order;
  kernel->x = (ssize_t)(order - 1) / 2;
  kernel->y = (ssize_t)(order - 1) / 2;
  kernel->values = (MagickRealType *)AcquireAlignedMemory(order, order*sizeof(*kernel->values));
  if (kernel->values != (MagickRealType *)NULL)
  {
    for (i = 0; i < (ssize_t)(order*order); i++)
      kernel->values[i] = (MagickRealType)values[i];
  }

  return kernel;
}

MAGICK_NATIVE_EXPORT void DoubleMatrix_Dispose(KernelInfo *instance)
{
  DestroyKernelInfo(instance);
}