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
    [parameter(mandatory=$true)][string]$destination
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function createNuGetPackage($version)
{
  $path = FullPath "publish\dotnet\Magick.Native.nuspec"
  $xml = [xml](Get-Content $path)
  $xml.package.metadata.version = $version

  $nuspecFile = FullPath "publish\dotnet\files\Magick.Native.nuspec"
  $xml.Save($nuspecFile)

  $nuget = FullPath "tools\windows\nuget.exe"
  & $nuget pack $nuspecFile -NoPackageAnalysis

  Copy-Item "*.nupkg" $destination
}

$version = [string](Get-Date -format "yyyy.MM.dd.HHmm")
createNuGetPackage $version $destination