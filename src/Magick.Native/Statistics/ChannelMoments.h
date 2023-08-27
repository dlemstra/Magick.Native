// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT const PointInfo *ChannelMoments_Centroid_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT double ChannelMoments_EllipseAngle_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT double ChannelMoments_EllipseEccentricity_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT double ChannelMoments_EllipseIntensity_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT const PointInfo *ChannelMoments_EllipseAxis_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT double ChannelMoments_GetHuInvariants(const ChannelMoments *, const size_t);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
