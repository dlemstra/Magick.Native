// Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
// Licensed under the Apache License, Version 2.0.
#pragma once

#if defined(__cplusplus) || defined(c_plusplus)
extern "C" {
#endif

MAGICK_NATIVE_EXPORT void Environment_Initialize(void);

MAGICK_NATIVE_EXPORT char *Environment_GetEnv(const char *name);

MAGICK_NATIVE_EXPORT void Environment_SetEnv(const char *name, const char *value);

#if defined(__cplusplus) || defined(c_plusplus)
}
#endif
