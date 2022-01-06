# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [string]$config = "Release",
    [string]$quantumName = $env:QuantumName,
    [string]$platformName = $env:PlatformName
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function buildNative($config, $quantumName, $platformName) {
    build "Magick.Native.sln" "Configuration=$config$quantumName,Platform=$platformName"
}

buildNative $config $quantumName $platformName
