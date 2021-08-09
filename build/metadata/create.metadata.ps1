# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [parameter(mandatory=$true)][string]$destination = $null
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

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

function writeVersionFromResource($fileName, $libraryName, $resourceFile) {
    $version = getVersion $resourceFile "#define DELEGATE_VERSION_STRING """ 1
    if ($version -ne $null) {
        Add-Content $fileName "- $libraryName $version"
    } else {
        Write-Error "Unable to get version for: $libraryName"
    }
}

function writeImageMagickVersion($fileName, $folder) {
    $major = getVersion "$folder\m4\version.m4" "m4_define([magick_major_version], [" 2
    $minor = getVersion "$folder\m4\version.m4" "m4_define([magick_minor_version], [" 2
    $micro = getVersion "$folder\m4\version.m4" "m4_define([magick_micro_version], [" 2
    $patchlevel = getVersion "$folder\m4\version.m4" "m4_define([magick_patchlevel_version], [" 2
    $version = "$major.$minor.$micro-$patchlevel"

    $current = Get-Location
    Set-Location $folder
    & cmd /c 'git describe --exact-match --tags HEAD > tag.txt 2> nul & exit 0'
    $tag = [IO.File]::ReadAllText("$folder\tag.txt").Trim()
    if ($tag.Length -eq 0) {
        $version = "$version beta"
    }
    & cmd /c 'git log -1 --format=%ci > date.txt 2> nul & exit 0'
    $date = [IO.File]::ReadAllText("$folder\date.txt").Trim()
    $date = $date.Split(" ")[0]

    Set-Location $current

    Add-Content $fileName "- ImageMagick $version ($date)"
}

function writeLibraryVersions($folders) {
    $sourceDir = fullPath "src/ImageMagick/libraries"
    $libraries = Get-ChildItem $sourceDir

    foreach ($library in $libraries) {
        $libraryName = $library.Name
        if ($libraryName -eq "VisualMagick") {
            continue;
        }

        $folder = "$sourceDir/$libraryName"

        $resourceFile = Get-ChildItem -Path $folder -Filter "ImageMagick.version.h" -Recurse
        if ($resourceFile -ne $null) {
            writeVersionFromResource $fileName $libraryName $resourceFile.FullName
        } else {
            switch($libraryName) {
                "ImageMagick" { writeImageMagickVersion $fileName $folder }
                "VisualMagick" { }
                default { Write-Error "Unable to get version for: $library" }
            }
        }
    }
}

function createLibrariesDocument($destination) {
    Remove-Item $destination -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path $destination)
    $fileName = "$destination\libraries.md"
    [void](New-Item -force $fileName)

    & cmd /c 'git rev-parse HEAD > commit.txt 2> nul'
    $commit = [IO.File]::ReadAllText("commit.txt").Trim()

    Add-Content $fileName "# Libraries"
    Add-Content $fileName "Magick.Native [$commit](https://github.com/dlemstra/Magick.Native/commit/$commit) is build with the following libraries:"
    Add-Content $fileName ""

    writeLibraryVersions $filename
}

createLibrariesDocument $destination
