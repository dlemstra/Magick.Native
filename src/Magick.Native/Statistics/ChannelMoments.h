// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

MAGICK_NATIVE_EXPORT const PointInfo *ChannelMoments_Centroid_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT const double ChannelMoments_EllipseAngle_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT const double ChannelMoments_EllipseEccentricity_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT const double ChannelMoments_EllipseIntensity_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT const PointInfo *ChannelMoments_EllipseAxis_Get(const ChannelMoments *);

MAGICK_NATIVE_EXPORT const double ChannelMoments_GetHuInvariants(const ChannelMoments *, const size_t);