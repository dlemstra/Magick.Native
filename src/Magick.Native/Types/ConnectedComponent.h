// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT void ConnectedComponent_DisposeList(CCObjectInfo *);

MAGICK_NATIVE_EXPORT size_t ConnectedComponent_GetArea(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT const PointInfo *ConnectedComponent_GetCentroid(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT const PixelInfo *ConnectedComponent_GetColor(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT size_t ConnectedComponent_GetHeight(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT ssize_t ConnectedComponent_GetId(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT size_t ConnectedComponent_GetWidth(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT ssize_t ConnectedComponent_GetX(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT ssize_t ConnectedComponent_GetY(const CCObjectInfo *);

MAGICK_NATIVE_EXPORT const CCObjectInfo *ConnectedComponent_GetInstance(const CCObjectInfo *, const size_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
