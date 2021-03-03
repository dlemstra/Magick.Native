// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "ConnectedComponent.h"
#include "Colors/MagickColor.h"

MAGICK_NATIVE_EXPORT void ConnectedComponent_DisposeList(CCObjectInfo *list)
{
  RelinquishMagickMemory(list);
}

MAGICK_NATIVE_EXPORT size_t ConnectedComponent_GetArea(const CCObjectInfo *instance)
{
  return (size_t) instance->area;
}

MAGICK_NATIVE_EXPORT const PointInfo *ConnectedComponent_GetCentroid(const CCObjectInfo *instance)
{
  return &instance->centroid;
}

MAGICK_NATIVE_EXPORT const PixelInfo *ConnectedComponent_GetColor(const CCObjectInfo *instance)
{
  return MagickColor_Clone(&instance->color);
}

MAGICK_NATIVE_EXPORT size_t ConnectedComponent_GetHeight(const CCObjectInfo *instance)
{
  return instance->bounding_box.height;
}

MAGICK_NATIVE_EXPORT ssize_t ConnectedComponent_GetId(const CCObjectInfo *instance)
{
  return instance->id;
}

MAGICK_NATIVE_EXPORT size_t ConnectedComponent_GetWidth(const CCObjectInfo *instance)
{
  return instance->bounding_box.width;
}

MAGICK_NATIVE_EXPORT ssize_t ConnectedComponent_GetX(const CCObjectInfo *instance)
{
  return instance->bounding_box.x;
}

MAGICK_NATIVE_EXPORT ssize_t ConnectedComponent_GetY(const CCObjectInfo *instance)
{
  return instance->bounding_box.y;
}

MAGICK_NATIVE_EXPORT const CCObjectInfo *ConnectedComponent_GetInstance(const CCObjectInfo *list, const size_t index)
{
  return list + index;
}