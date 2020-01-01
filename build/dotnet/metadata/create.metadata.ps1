# Copyright 2013-2020 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
#
# Licensed under the ImageMagick License (the "License"); you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
#
#   https://www.imagemagick.org/script/license.php
#
# Unless required by applicable law or agreed to in writing, software distributed under the
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and limitations under the License.

param (
    [parameter(mandatory=$true)][string]$destination = $null
)

. $PSScriptRoot\..\..\..\tools\windows\utils.ps1

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
    $version = GetVersion $resourceFile "#define THIS_PROJECT_VERSION_STRING		""" 1
    if ($version -ne $null) {
        Add-Content $fileName "- $libraryName $version"
    }
}

function writeCrocoVersion($fileName, $folder) {
    $version = GetVersion "$folder\src\libcroco-config.h" "#define LIBCROCO_VERSION """ 1
    Add-Content $fileName "- croco $version"
}

function writeFfiVersion($fileName, $folder) {
    $version = GetVersion "$folder\configure.ac" "AC_INIT([libffi], [" 45
    Add-Content $fileName "- ffi $version"
}

function writeImageMagickVersion($fileName, $folder) {
    $packageVersion = GetVersion "$folder\version.sh" "PACKAGE_VERSION='" 1
    $packageRelease = GetVersion "$folder\version.sh" "PACKAGE_RELEASE=""" 1
    Add-Content $fileName "- ImageMagick $packageVersion-$packageRelease"
}

function writePixmanVersion($fileName, $folder) {
    $version = GetVersion "$folder\pixman\pixman-version.h" "#define PIXMAN_VERSION_STRING """ 1
    Add-Content $fileName "- pixman $version"
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

        $resourceFile = Get-ChildItem -Path $folder -Filter "Resource.rc" -Recurse
        if ($resourceFile -ne $null) {
            writeVersionFromResource $fileName $libraryName $resourceFile.FullName
        } else {
            switch($libraryName)
            {
                "croco" { writeCrocoVersion $fileName $folder }
                "ffi" { writeFfiVersion $fileName $folder }
                "ImageMagick" { writeImageMagickVersion $fileName $folder }
                "pixman" { writePixmanVersion $fileName $folder }
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

    Add-Content $fileName "# Libraries"
    Add-Content $fileName "Magick.Native is build with the following libraries:"
    Add-Content $fileName ""

    writeLibraryVersions $filename
}

createLibrariesDocument $destination
