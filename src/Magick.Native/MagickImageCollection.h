// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Append(const Image *, const MagickBooleanType, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Coalesce(const Image *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Combine(Image *, const ColorspaceType, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Complex(Image *, const ComplexOperator, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickImageCollection_Dispose(Image *);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Deconstruct(const Image *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Evaluate(const Image *, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Fx(Image *, const char *, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickImageCollection_Map(Image *, const QuantizeInfo *, const Image *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Merge(Image *, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Montage(const Image *, const MontageInfo *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Morph(const Image *, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Optimize(const Image *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_OptimizePlus(const Image *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickImageCollection_OptimizeTransparency(Image *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Polynomial(Image *, const double *, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickImageCollection_Quantize(Image *, const QuantizeInfo *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_ReadBlob(const ImageInfo *, const unsigned char *, const size_t, const size_t, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_ReadFile(ImageInfo *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_ReadStream(ImageInfo *, const CustomStreamHandler, const CustomStreamSeeker, const CustomStreamTeller, void *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT Image *MagickImageCollection_Smush(const Image *, const ssize_t, const MagickBooleanType, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickImageCollection_WriteFile(Image *, const ImageInfo *, ExceptionInfo **);

MAGICK_NATIVE_EXPORT void MagickImageCollection_WriteStream(Image *, ImageInfo *, const CustomStreamHandler, const CustomStreamSeeker, const CustomStreamTeller, const CustomStreamHandler, void *, ExceptionInfo **);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
