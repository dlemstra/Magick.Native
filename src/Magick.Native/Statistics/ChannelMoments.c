// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "ChannelMoments.h"

MAGICK_NATIVE_EXPORT const PointInfo *ChannelMoments_Centroid_Get(const ChannelMoments *instance)
{
  return &instance->centroid;
}

MAGICK_NATIVE_EXPORT const double ChannelMoments_EllipseAngle_Get(const ChannelMoments *instance)
{
  return instance->ellipse_angle;
}

MAGICK_NATIVE_EXPORT const PointInfo *ChannelMoments_EllipseAxis_Get(const ChannelMoments *instance)
{
  return &instance->ellipse_axis;
}

MAGICK_NATIVE_EXPORT const double ChannelMoments_EllipseEccentricity_Get(const ChannelMoments *instance)
{
  return instance->ellipse_eccentricity;
}

MAGICK_NATIVE_EXPORT const double ChannelMoments_EllipseIntensity_Get(const ChannelMoments *instance)
{
  return instance->ellipse_intensity;
}

MAGICK_NATIVE_EXPORT const double ChannelMoments_GetHuInvariants(const ChannelMoments *instance, const size_t index)
{
  return instance->invariant[index];
}