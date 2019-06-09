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
    [string]$quantumName = $env:QuantumName,
    [string]$platformName = $env:PlatformName,
    [parameter(mandatory=$true)][string]$folder,
    [string]$pfxPassword = ''
)

. $PSScriptRoot\..\..\..\tools\windows\utils.ps1

function signLibrary($folder, $quantumName, $platformName, $pfxPassword) {
    if ($pfxPassword -eq '') {
        return
    }

    $pfxFile = fullPath "build\dotnet\windows\ImageMagick.pfx"
    $signtool = "C:\Program Files (x86)\Windows Kits\10\bin\x64\signtool.exe"

    $fileName = "$folder\Release$quantumName\$platformName\Magick.Native-$quantumName-$platformName.dll"

    & $signtool sign /f "$pfxFile" /p "$pfxPassword" /tr http://sha256timestamp.ws.symantec.com/sha256/timestamp /td sha256 /fd sha256 $fileName
    CheckExitCode "Failed to sign files."
}

signLibrary $folder $quantumName $platformName $pfxPassword
