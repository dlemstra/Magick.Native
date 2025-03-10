# Copyright 2013-2021 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
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
