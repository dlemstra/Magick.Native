// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT char **MagickFormatInfo_CreateList(size_t *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickFormatInfo_DisposeList(char **, const size_t);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_CanReadMultithreaded_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_CanWriteMultithreaded_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_Description_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_Format_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_MimeType_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT const char *MagickFormatInfo_Module_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_SupportsMultipleFrames_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_SupportsReading_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT MagickBooleanType MagickFormatInfo_SupportsWriting_Get(const MagickInfo *);

MAGICK_NATIVE_EXPORT const MagickInfo *MagickFormatInfo_GetInfo(char **, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT const MagickInfo *MagickFormatInfo_GetInfoByName(const char *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT const MagickInfo *MagickFormatInfo_GetInfoWithBlob(const unsigned char *, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickFormatInfo_Unregister(const char *format);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
