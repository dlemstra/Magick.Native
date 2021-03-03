// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "PointInfo.h"

MAGICK_NATIVE_EXPORT double PointInfo_X_Get(const PointInfo *instance)
{
  return instance->x;
}

MAGICK_NATIVE_EXPORT double PointInfo_Y_Get(const PointInfo *instance)
{
  return instance->y;
}