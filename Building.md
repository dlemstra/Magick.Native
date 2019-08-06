# Building Magick.Native

This document describes the requirements and instructions to build Magick.Native.

### Requirements

- Windows:
  - Visual Studio 2019
  - Powershell (>= 3.0)
  - Git for Windows (>= 2.7.2)
  - Windows SDK (>= 10.0.10586)
  - Docker
- Linux:
  - Docker

### Building the library

Magick.NET.Native uses the ImageMagick 7 library and that needs to be build first. The library can be build for Windows, Linux,
macOS and WASM and each of these platforms have their own build steps. This project uses Azure Pipelines to build the library
and the steps that are down for each platform can be found inside the build directory:

- Windows: [build.yml](blob/master/build/dotnet/windows/build.yml)
- Linux: [build.yml](blob/master/build/dotnet/linux/build.yml)
- macOS: [build.yml](blob/master/build/dotnet/macos/build.yml)

For Linux and macOS the scripts that are in the build.yml file can just be executed. For Windows the following environment
variables need to be set before executing the scripts:

- `%QuantumName%` (Allowed values Q8, Q8-OpenMP, Q16, Q16-OpenMP, Q16-HDRI, Q16-HDRI-OpenMP)
- `%PlatformName%` (Allowed values: x64, x86)