// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "ResourceLimits.h"

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Area_Get(void)
{
  return GetMagickResourceLimit(AreaResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Area_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(AreaResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Disk_Get(void)
{
  return GetMagickResourceLimit(DiskResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Disk_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(DiskResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Height_Get(void)
{
  return GetMagickResourceLimit(HeightResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Height_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(HeightResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_ListLength_Get(void)
{
  return GetMagickResourceLimit(ListLengthResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_ListLength_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(ListLengthResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Memory_Get(void)
{
  return GetMagickResourceLimit(MemoryResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Memory_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(MemoryResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Thread_Get(void)
{
  return GetMagickResourceLimit(ThreadResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Thread_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(ThreadResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Throttle_Get(void)
{
  return GetMagickResourceLimit(ThrottleResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Throttle_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(ThrottleResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Width_Get(void)
{
  return GetMagickResourceLimit(WidthResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Width_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(WidthResource, limit);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_LimitMemory(const double percentage)
{
  double
    pages;

  MagickSizeType
    memory;

  ssize_t
    pagesize;

  pagesize = GetMagickPageSize();
  pages = (double) sysconf(_SC_PHYS_PAGES) * percentage;
  memory = (MagickSizeType) pages * pagesize;
  ResourceLimits_Area_Set(memory * 2);
  ResourceLimits_Memory_Set(memory);
}