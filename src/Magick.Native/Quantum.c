// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.

#include "Stdafx.h"
#include "Quantum.h"

MAGICK_NATIVE_EXPORT size_t Quantum_Depth_Get(void)
{
  return MAGICKCORE_QUANTUM_DEPTH;
}

MAGICK_NATIVE_EXPORT Quantum Quantum_Max_Get(void)
{
#if (MAGICKCORE_QUANTUM_DEPTH == 8)
  return (Quantum)255;
#elif (MAGICKCORE_QUANTUM_DEPTH == 16)
  return (Quantum)65535;
#else
#error Not implemented!
#endif
}

MAGICK_NATIVE_EXPORT unsigned char Quantum_ScaleToByte(const Quantum value)
{
  return ScaleQuantumToChar(value);
}