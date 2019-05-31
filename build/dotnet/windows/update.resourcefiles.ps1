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

. $PSScriptRoot\utils.ps1

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
    $path = fullPath "src\Native\Resources"

    Get-ChildItem -Path $path -Filter *.rc -Recurse -File -Name | ForEach-Object {
        updateResourceFile "$path\$_" $version
    }
}

function getVersion() {
    $path = fullPath "src\ImageMagick\libraries\ImageMagick\MagickCore\version.h"
    $match = "#define MagickLibVersionNumber  "
    $lines = [System.IO.File]::ReadAllLines($path)
    foreach ($line in $lines)
    {
        if (!$line.StartsWith($match))
        {
            continue
        }

        return $line.SubString($match.Length, $line.Length - $match.Length).Replace(",", ".")
    }

    Write-Error "Unable to get version."

    return $null
}

$version = getVersion

if ($version -ne $null) {
    updateResourceFiles $version
}