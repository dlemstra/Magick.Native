# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.Native.
# Licensed under the Apache License, Version 2.0.

function checkExitCode($msg)
{
    if ($LastExitCode -ne 0)
    {
        Write-Error $msg
        Exit 1
    }
}

function fullPath($path)
{
    return "$PSScriptRoot\..\..\$path"
}

function build($fileName, $properties)
{
    $path = fullPath $fileName
    $directory = Split-Path -parent $path
    $file = Split-Path -leaf $path

    $location = $(Get-Location)
    Set-Location $directory

    msbuild $file /t:Rebuild /m ("/p:$($properties)")
    checkExitCode "Failed to build: $($path)"

    Set-Location $location
}
