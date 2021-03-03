# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function setValue($content, $startMatch, $endMatch, $value) {
    $start = $content.IndexOf($startMatch)
    if ($start -eq -1)
    {
        Write-Error "Unable to find startMatch"
        Exit 1
    }

    $start += $startMatch.Length

    $newContent = $content.Substring(0, $start)
    $newContent += $value

    $start = $content.IndexOf($endMatch, $start)
    if ($start -eq -1)
    {
        Write-Error "Unable to find endMatch"
        Exit 1
    }

    $newContent += $content.Substring($start)
    return $newContent
}

function updateResourceFile($fileName, $version) {
    $content = [IO.File]::ReadAllText($fileName, [System.Text.Encoding]::Unicode)
    $content = setValue $content "FILEVERSION " `r $version.Replace('.', ',')
    $content = setValue $content "PRODUCTVERSION " `r $version.Replace('.', ',')
    $content = setValue $content "`"FileVersion`", `""  "`"" $version
    $content = setValue $content "`"ProductVersion`", `"" "`"" $version
    $content = setValue $content "`"LegalCopyright`", `"" "`"" "Copyright 2013-$((Get-Date).year) Dirk Lemstra"

    [IO.File]::WriteAllText($fileName, $content, [System.Text.Encoding]::Unicode)
}

function updateResourceFiles($version) {
    $path = fullPath "src\Magick.Native\Resources"

    Get-ChildItem -Path $path -Filter *.rc -Recurse -File -Name | ForEach-Object {
        updateResourceFile "$path\$_" $version
    }
}

function getVersion($fileName, $start, $padding) {
    $lines = [System.IO.File]::ReadAllLines($fileName)
    foreach ($line in $lines) {
        if ($line.StartsWith($start)) {
            return $line.SubString($start.Length, $line.Length - $start.Length - $padding).Replace(",", ".")
        }
    }

    Write-Error "Unable to get version from: $fileName"

    return $null
}

function getImageMagickVersion() {
    $versionFile = fullPath "src\ImageMagick\libraries\ImageMagick\m4\version.m4"
    $major = getVersion $versionFile "m4_define([magick_major_version], [" 2
    $minor = getVersion $versionFile "m4_define([magick_minor_version], [" 2
    $micro = getVersion $versionFile "m4_define([magick_micro_version], [" 2
    $patchlevel = getVersion $versionFile "m4_define([magick_patchlevel_version], [" 2
    return "$major.$minor.$micro.$patchlevel"
}

$version = getImageMagickVersion

if ($version -ne $null) {
    updateResourceFiles $version
}