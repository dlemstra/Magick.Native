// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT size_t Quantum_Depth_Get(void);

MAGICK_NATIVE_EXPORT Quantum Quantum_Max_Get(void);

MAGICK_NATIVE_EXPORT unsigned char Quantum_ScaleToByte(const Quantum);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
