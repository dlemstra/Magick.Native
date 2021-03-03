# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [parameter(mandatory=$true)][string]$destination
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function createNuGetPackage($version, $destination)
{
  $path = FullPath "publish\dotnet\Magick.Native.nuspec"
  $xml = [xml](Get-Content $path)
  $xml.package.metadata.version = $version

  $nuspecFile = FullPath "publish\dotnet\files\Magick.Native.nuspec"
  $xml.Save($nuspecFile)

  $nuget = FullPath "tools\windows\nuget.exe"
  & $nuget pack $nuspecFile -NoPackageAnalysis

  Remove-Item $destination -Recurse -ErrorAction Ignore
  [void](New-Item -ItemType directory -Path $destination)
  Copy-Item "*.nupkg" $destination
}

$version = (Get-Date).ToUniversalTime().ToString("yyyy.MM.dd.HHmm")
createNuGetPackage $version $destination
