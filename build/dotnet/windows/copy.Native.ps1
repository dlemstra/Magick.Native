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
    [string]$destination = $null
)

. $PSScriptRoot\..\..\..\tools\windows\utils.ps1

function copyNative($config, $quantumName, $platformName, $destination) {
    $source = fullPath "src\Native\bin\$config$quantumName\$platformName\Magick.Native-$quantumName-$platformName.dll"
    Copy-Item $source $destination
}

if ($destination -eq $null) {
    $destination = fullPath "build\dotnet\windows\output"
}

copyNative "Release" $env:QuantumName $env:PlatformName $destination
