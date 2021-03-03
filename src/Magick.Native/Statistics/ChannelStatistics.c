// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "ChannelStatistics.h"

MAGICK_NATIVE_EXPORT const size_t ChannelStatistics_Depth_Get(const ChannelStatistics *instance)
{
  return instance->depth;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Entropy_Get(const ChannelStatistics *instance)
{
  return instance->entropy;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Kurtosis_Get(const ChannelStatistics *instance)
{
  return instance->kurtosis;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Maximum_Get(const ChannelStatistics *instance)
{
  return instance->maxima;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Mean_Get(const ChannelStatistics *instance)
{
  return instance->mean;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Minimum_Get(const ChannelStatistics *instance)
{
  return instance->minima;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Skewness_Get(const ChannelStatistics *instance)
{
  return instance->skewness;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_StandardDeviation_Get(const ChannelStatistics *instance)
{
  return instance->standard_deviation;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Sum_Get(const ChannelStatistics *instance)
{
  return instance->sum;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_SumCubed_Get(const ChannelStatistics *instance)
{
  return instance->sum_cubed;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_SumFourthPower_Get(const ChannelStatistics *instance)
{
  return instance->sum_fourth_power;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_SumSquared_Get(const ChannelStatistics *instance)
{
  return instance->sum_squared;
}

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Variance_Get(const ChannelStatistics *instance)
{
  return instance->variance;
}