// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Area_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Area_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Disk_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Disk_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Height_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Height_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_ListLength_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_ListLength_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_MaxMemoryRequest_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_MaxMemoryRequest_Set(const MagickSizeType, ExceptionInfo **);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_MaxProfileSize_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_MaxProfileSize_Set(const MagickSizeType, ExceptionInfo **);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Memory_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Memory_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Thread_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Thread_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Throttle_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Throttle_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Time_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Time_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Width_Get(void);
MAGICK_NATIVE_EXPORT void ResourceLimits_Width_Set(const MagickSizeType);

MAGICK_NATIVE_EXPORT void ResourceLimits_LimitMemory(const double);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
