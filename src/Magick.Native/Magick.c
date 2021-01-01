// Copyright 2013-2021 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
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
#include "Magick.h"

MAGICK_NATIVE_EXPORT const char *Magick_Delegates_Get(void)
{
  return GetMagickDelegates();
}

MAGICK_NATIVE_EXPORT const char *Magick_Features_Get(void)
{
  return GetMagickFeatures();
}

MAGICK_NATIVE_EXPORT const char *Magick_ImageMagickVersion_Get(void)
{
  return GetMagickVersion(NULL);
}

MAGICK_NATIVE_EXPORT const TypeInfo **Magick_GetFonts(size_t *length, ExceptionInfo **exception)
{
  const TypeInfo
    **font_families;

  MAGICK_NATIVE_GET_EXCEPTION;
  font_families = GetTypeInfoList("*", length, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return font_families;
}

MAGICK_NATIVE_EXPORT const char *Magick_GetFontFamily(const TypeInfo **list, const size_t index)
{
  if (list[index]->stealth != MagickFalse)
    return (const char *) NULL;

  return list[index]->family;
}

MAGICK_NATIVE_EXPORT const char *Magick_GetFontName(const TypeInfo **list, const size_t index)
{
  if (list[index]->stealth != MagickFalse)
    return (const char *) NULL;

  return list[index]->name;
}

MAGICK_NATIVE_EXPORT void Magick_DisposeFonts(TypeInfo **list)
{
  RelinquishMagickMemory((void *) list);
}

MAGICK_NATIVE_EXPORT void Magick_SetRandomSeed(const unsigned long seed)
{
  SetRandomSecretKey(seed);
}

MAGICK_NATIVE_EXPORT void Magick_SetLogDelegate(const MagickLogMethod method)
{
  SetLogMethod(method);
}

MAGICK_NATIVE_EXPORT void Magick_SetLogEvents(const char *events)
{
  SetLogEventMask(events);
}

MAGICK_NATIVE_EXPORT MagickBooleanType Magick_SetOpenCLEnabled(const MagickBooleanType value)
{
  return SetOpenCLEnabled(value);
}