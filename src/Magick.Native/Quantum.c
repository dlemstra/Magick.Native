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
  return QuantumRange;
}
