// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

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

MAGICK_NATIVE_EXPORT unsigned char *Magick_GetWindowsResource(const char *id)
{
#if defined(MAGICK_NATIVE_WINDOWS)
  return NTResourceToBlob(id);
#else
  return (unsigned char *) NULL;
#endif
}

MAGICK_NATIVE_EXPORT void Magick_DisposeFonts(TypeInfo **list)
{
  RelinquishMagickMemory((void *) list);
}

MAGICK_NATIVE_EXPORT void Magick_ResetRandomSeed(void)
{
  SetRandomSecretKey(ULONG_MAX);
}

MAGICK_NATIVE_EXPORT void Magick_SetDefaultFontFile(const char *fileName, ExceptionInfo **exception)
{
  MAGICK_NATIVE_GET_EXCEPTION;
  SetMagickSecurityPolicyValue(SystemPolicyDomain, "font", fileName, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
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
