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
