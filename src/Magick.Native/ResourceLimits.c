// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "ResourceLimits.h"

#if defined(MAGICK_NATIVE_LINUX) || defined(MAGICK_NATIVE_WASM)
  #include <malloc.h>
#elif defined(MAGICK_NATIVE_MACOS)
  #include <malloc/malloc.h>
#endif


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

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_MaxMemoryRequest_Get(void)
{
  return (MagickSizeType) GetMaxMemoryRequest();
}

MAGICK_NATIVE_EXPORT void ResourceLimits_MaxMemoryRequest_Set(const MagickSizeType limit, ExceptionInfo **exception)
{
  char
    buffer[21];

  MAGICK_NATIVE_GET_EXCEPTION;
  snprintf(buffer, sizeof(buffer), "%llu", limit);
  (void) SetMagickSecurityPolicyValue(SystemPolicyDomain, "max-memory-request", buffer, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_MaxProfileSize_Get(void)
{
  return (MagickSizeType) GetMaxProfileSize();
}

MAGICK_NATIVE_EXPORT void ResourceLimits_MaxProfileSize_Set(const MagickSizeType limit, ExceptionInfo **exception)
{
  char
    buffer[21];

  MAGICK_NATIVE_GET_EXCEPTION;
  snprintf(buffer, sizeof(buffer), "%llu", limit);
  (void) SetMagickSecurityPolicyValue(SystemPolicyDomain, "max-profile-size", buffer, exceptionInfo);
  MAGICK_NATIVE_SET_EXCEPTION;
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

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Time_Get(void)
{
  return GetMagickResourceLimit(TimeResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Time_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(TimeResource, limit);
}

MAGICK_NATIVE_EXPORT MagickSizeType ResourceLimits_Width_Get(void)
{
  return GetMagickResourceLimit(WidthResource);
}

MAGICK_NATIVE_EXPORT void ResourceLimits_Width_Set(const MagickSizeType limit)
{
  SetMagickResourceLimit(WidthResource, limit);
}

static unsigned long long GetContainerMemoryLimit()
{
#if defined(MAGICK_NATIVE_WINDOWS)
  return 0;
#else
  int
    fd;

  unsigned long long
    memory_limit;

  memory_limit = 0;
  fd = open("/sys/fs/cgroup/memory/memory.limit_in_bytes", O_RDONLY);
  if (fd == -1)
    fd = open("/sys/fs/cgroup/memory.max", O_RDONLY);
  if (fd != -1)
  {
    char
      buffer[256];

    int
      count;

    count = read(fd, buffer, sizeof(buffer) - 1);
    if (count != -1)
    {
      buffer[count] = '\0';
      memory_limit = strtoull(buffer, NULL, 10);
    }
    close(fd);
  }

  return memory_limit;
#endif
}

MAGICK_NATIVE_EXPORT void ResourceLimits_LimitMemory(const double percentage)
{
  double
    total_memory;

  MagickSizeType
    memory;

  unsigned long long
    container_memory_limit;

  total_memory = (double) GetMagickPageSize() * (double) sysconf(_SC_PHYS_PAGES);
  container_memory_limit = GetContainerMemoryLimit();
  if (container_memory_limit != 0 && (double) container_memory_limit < total_memory)
    total_memory = (double) container_memory_limit;
  memory = (MagickSizeType) (total_memory * percentage);
  ResourceLimits_Area_Set(memory * 4);
  ResourceLimits_Memory_Set(memory);
}

MAGICK_NATIVE_EXPORT MagickBooleanType ResourceLimits_TrimMemory()
{
#if (defined(MAGICK_NATIVE_LINUX) && !defined(__MUSL__)) || defined(MAGICK_NATIVE_WASM))
  if (malloc_trim(0))
    return MagickTrue;
#elif defined(MAGICK_NATIVE_MACOS)
  malloc_zone_pressure_relief(NULL, 0);
  return MagickTrue;
#endif
  return MagickFalse;
}
