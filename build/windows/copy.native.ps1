# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [string]$config = "Release",
    [string]$quantumName = $env:QuantumName,
    [string]$platformName = $env:PlatformName,
    [parameter(mandatory=$true)][string]$destination
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function copyNative($config, $quantumName, $platformName, $destination) {
    $libraryFolder = "$destination\windows\$config$quantumName\$platformName"
    Remove-Item $libraryFolder -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path $libraryFolder)

    $source = fullPath "src\Magick.Native\bin\$config$quantumName\$platformName\Magick.Native-$quantumName-$platformName.dll"
    Copy-Item $source $libraryFolder

    $resourcesFolder = "$destination\resources\$config$quantumName\$platformName"
    Remove-Item $resourcesFolder -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path $resourcesFolder)

    $source = fullPath "src\Magick.Native\Resources\xml\*.xml"
    Copy-Item $source $resourcesFolder
    $source = fullPath "src\ImageMagick\output\resources\$config$quantumName\$platformName\*.xml"
    Copy-Item $source $resourcesFolder
}

copyNative $config $quantumName $platformName $destination
