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

. $PSScriptRoot\utils.ps1

function copyNative($config, $name, $platform, $destination) {
    $source = fullPath "src\Native\bin\$config$name\$platform\Magick.Native-$name-$platform.dll"
    Copy-Item $source $destination
}

if ($destination -eq $null) {
    $destination = fullPath "build\dotnet\windows\output"
}

copyNative "Release" "Q8" "x86" $destination