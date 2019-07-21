// Copyright 2013-2019 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
//
// Licensed under the ImageMagick License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
//   https://www.imagemagick.org/script/license.php
//
// Unless required by applicable law or agreed to in writing, software distributed under the
// License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions
// and limitations under the License.

#include "Stdafx.h"
#include "PrimaryInfo.h"

MAGICK_NATIVE_EXPORT PrimaryInfo *PrimaryInfo_Create(void)
{
  return AcquireMagickMemory(sizeof(PrimaryInfo));
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_Dispose(PrimaryInfo *instance)
{
  RelinquishMagickMemory(instance);
}

MAGICK_NATIVE_EXPORT double PrimaryInfo_X_Get(const PrimaryInfo *instance)
{
  return instance->x;
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_X_Set(PrimaryInfo *instance, const double value)
{
  instance->x = value;
}

MAGICK_NATIVE_EXPORT double PrimaryInfo_Y_Get(const PrimaryInfo *instance)
{
  return instance->y;
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_Y_Set(PrimaryInfo *instance, const double value)
{
  instance->y = value;
}

MAGICK_NATIVE_EXPORT double PrimaryInfo_Z_Get(const PrimaryInfo *instance)
{
  return instance->z;
}

MAGICK_NATIVE_EXPORT void PrimaryInfo_Z_Set(PrimaryInfo *instance, const double value)
{
  instance->z = value;
}