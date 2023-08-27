// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT const size_t ChannelStatistics_Depth_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Entropy_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Kurtosis_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Maximum_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Mean_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Minimum_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_Skewness_Get(const ChannelStatistics *);

MAGICK_NATIVE_EXPORT const double ChannelStatistics_StandardDeviation_Get(const ChannelStatistics *);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
