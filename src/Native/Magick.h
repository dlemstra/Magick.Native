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
#pragma once

MAGICK_NATIVE_EXPORT const char *Magick_Delegates_Get(void);

MAGICK_NATIVE_EXPORT const char *Magick_Features_Get(void);

MAGICK_NATIVE_EXPORT const TypeInfo **Magick_GetFonts(size_t *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT const char *Magick_GetFontFamily(const TypeInfo **, const size_t);

MAGICK_NATIVE_EXPORT const char *Magick_GetFontName(const TypeInfo **, const size_t);

MAGICK_NATIVE_EXPORT void Magick_DisposeFonts(TypeInfo **);

MAGICK_NATIVE_EXPORT void Magick_SetLogDelegate(const MagickLogMethod);

MAGICK_NATIVE_EXPORT void Magick_SetLogEvents(const char *);

MAGICK_NATIVE_EXPORT void Magick_SetRandomSeed(const unsigned long);

MAGICK_NATIVE_EXPORT MagickBooleanType Magick_SetOpenCLEnabled(const MagickBooleanType);