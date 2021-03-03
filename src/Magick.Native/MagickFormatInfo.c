// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "MagickFormatInfo.h"

static inline const MagickInfo *GetInfoByName(const char *name, ExceptionInfo **exception)
{
  const MagickInfo
    *info;

  MAGICK_NATIVE_GET_EXCEPTION;
  info = GetMagickInfo(name, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return info;
}

MAGICK_NATIVE_EXPORT char **MagickFormatInfo_CreateList(size_t *length, ExceptionInfo **exception)
{
  char
    **coder_list;

  MAGICK_NATIVE_GET_EXCEPTION;
  coder_list = GetMagickList("*", length, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
  return coder_list;
}

MAGICK_NATIVE_EXPORT void MagickFormatInfo_DisposeList(char **list, const size_t length)
{
  ssize_t
    i;

  for (i = 0; i < (ssize_t)length; i++)
  {
    list[i] = (char *)RelinquishMagickMemory(list[i]);
  }

  RelinquishMagickMemory(list);
}

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_CanReadMultithreaded_Get(const MagickInfo *instance)
{
  return GetMagickDecoderThreadSupport(instance);
}

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_CanWriteMultithreaded_Get(const MagickInfo *instance)
{
  return GetMagickEncoderThreadSupport(instance);
}

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_Description_Get(const MagickInfo *instance)
{
  return GetMagickDescription(instance);
}

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_Format_Get(const MagickInfo *instance)
{
  return instance->name;
}

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_IsMultiFrame_Get(const MagickInfo *instance)
{
  return GetMagickAdjoin(instance);
}

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_IsReadable_Get(const MagickInfo *instance)
{
  return GetImageDecoder(instance) != (DecodeImageHandler *)NULL;
}

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_IsWritable_Get(const MagickInfo *instance)
{
  return GetImageEncoder(instance) != (EncodeImageHandler *)NULL;
}

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_MimeType_Get(const MagickInfo *instance)
{
  return GetMagickMimeType(instance);
}

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_Module_Get(const MagickInfo *instance)
{
  return instance->module;
}

MAGICK_NATIVE_EXPORT const MagickInfo *MagickFormatInfo_GetInfo(char **list, const size_t index, ExceptionInfo **exception)
{
  return GetInfoByName(list[index], exception);
}

MAGICK_NATIVE_EXPORT const MagickInfo *MagickFormatInfo_GetInfoByName(const char *name, ExceptionInfo **exception)
{
  return GetInfoByName(name, exception);
}

MAGICK_NATIVE_EXPORT void MagickFormatInfo_Unregister(const char *format)
{
  UnregisterMagickInfo(format);
}