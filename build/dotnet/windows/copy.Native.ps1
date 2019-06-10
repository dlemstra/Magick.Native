# Copyright 2013-2019 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
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
    [string]$config = "Release",
    [string]$quantumName = $env:QuantumName,
    [string]$platformName = $env:PlatformName,
    [parameter(mandatory=$true)][string]$destination
)

. $PSScriptRoot\..\..\..\tools\windows\utils.ps1

function copyNative($config, $quantumName, $platformName, $destination) {
    $target = "$destination\$config$quantumName\$platformName"
    Remove-Item $target -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path $target)

    $source = fullPath "src\Native\bin\$config$quantumName\$platformName\Magick.Native-$quantumName-$platformName.dll"
    Copy-Item $source $target
    $source = fullPath "src\Native\Resources\xml\*.xml"
    Copy-Item $source $target
    $source = fullPath "src\ImageMagick\output\resources\$config$quantumName\$platformName\*.xml"
    Copy-Item $source $target
}

copyNative $config $quantumName $platformName $destination
