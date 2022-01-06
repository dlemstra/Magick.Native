# Building Magick.Native

This document describes the requirements and instructions to build Magick.Native.

### Requirements

- Windows:
  - Visual Studio 2022
  - Powershell (>= 3.0)
  - Git for Windows (>= 2.7.2)
  - Windows SDK (>= 10.0.10586)
  - Docker
- Linux:
  - Docker

### Building the library

Magick.Native uses the ImageMagick 7 library and that needs to be build first. The library can be build for Windows, Linux,
macOS and WASM and each of these platforms have their own build steps. This project uses GitHub actions to build the library
and the steps that are done for each platform can be found inside the following workflow:

[main.yml](.github/workflows/main.yml)

For Linux and macOS the scripts that are in the main.yml file can just be executed. For Windows the following environment
variables need to be set before executing the scripts:

- `%QuantumName%` (Allowed values Q8, Q8-OpenMP, Q16, Q16-OpenMP, Q16-HDRI, Q16-HDRI-OpenMP)
- `%PlatformName%` (Allowed values: x64, x86)

There are also some build scripts in folder `src/ImageMagick/build` that can be used to build ImageMagick.
