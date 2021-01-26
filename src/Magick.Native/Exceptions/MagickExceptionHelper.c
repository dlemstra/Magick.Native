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
#include "MagickExceptionHelper.h"

static inline size_t AreExceptionsEqual(const ExceptionInfo *a, const ExceptionInfo *b)
{
  if ((a->severity != b->severity) ||
    (LocaleCompare(a->reason, b->reason) != 0) ||
    (LocaleCompare(a->description, b->description) != 0))
    return MagickFalse;

  return MagickTrue;
}

MAGICK_NATIVE_EXPORT const char *MagickExceptionHelper_Description(const ExceptionInfo *instance)
{
  return instance->description;
}

MAGICK_NATIVE_EXPORT void MagickExceptionHelper_Dispose(ExceptionInfo *instance)
{
  DestroyExceptionInfo(instance);
}

MAGICK_NATIVE_EXPORT const ExceptionInfo *MagickExceptionHelper_Related(const ExceptionInfo *instance, const size_t index)
{
  const ExceptionInfo
    *p,
    *q;

  LinkedListInfo
    *exceptions;

  size_t
    count;

  ssize_t
    i,
    j,
    length;

  count = 0;
  exceptions = (LinkedListInfo *) instance->exceptions;
  if (exceptions == (LinkedListInfo *) NULL)
    return (ExceptionInfo *) NULL;

  length = (ssize_t) GetNumberOfElementsInLinkedList(exceptions);
  for (i = 0; i < length; i++)
  {
    MagickBooleanType
      found;

    p = (const ExceptionInfo *) GetValueFromLinkedList(exceptions, i);
    found = AreExceptionsEqual(p, instance);
    if (found != MagickFalse)
      continue;

    for (j = 0; j < i; j++)
    {
      q = (const ExceptionInfo *) GetValueFromLinkedList(exceptions, j);
      if (AreExceptionsEqual(p, q) != MagickFalse)
      {
        found = MagickTrue;
        break;
      }
    }

    if (found == MagickFalse)
    {
      if (count == index)
        return p;

      count++;
    }
  }

  return (ExceptionInfo *) NULL;
}

MAGICK_NATIVE_EXPORT size_t MagickExceptionHelper_RelatedCount(const ExceptionInfo *instance)
{
  const ExceptionInfo
    *p,
    *q;

  LinkedListInfo
    *exceptions;

  size_t
    count;

  ssize_t
    i,
    j,
    length;

  count = 0;
  exceptions = (LinkedListInfo *) instance->exceptions;
  if (exceptions == (LinkedListInfo *) NULL)
    return count;

  length = (ssize_t) GetNumberOfElementsInLinkedList(exceptions);
  for (i = 0; i < length; i++)
  {
    MagickBooleanType
      found;

    p = (const ExceptionInfo *) GetValueFromLinkedList(exceptions, i);
    found = AreExceptionsEqual(p, instance);
    if (found != MagickFalse)
      continue;

    for (j = 0; j < i; j++)
    {
      q = (const ExceptionInfo *) GetValueFromLinkedList(exceptions, j);
      if (AreExceptionsEqual(p, q) != MagickFalse)
      {
        found = MagickTrue;
        break;
      }
    }

    if (found == MagickFalse)
      count++;
  }

  return count;
}

MAGICK_NATIVE_EXPORT const char *MagickExceptionHelper_Message(const ExceptionInfo *instance)
{
  return instance->reason;
}

MAGICK_NATIVE_EXPORT ExceptionType MagickExceptionHelper_Severity(const ExceptionInfo *instance)
{
  return instance->severity;
}