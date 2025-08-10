# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [parameter(mandatory=$true)][string]$version,
    [parameter(mandatory=$true)][string]$destination
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function createNuGetPackage($version, $destination)
{
  $path = FullPath "publish\dotnet\Magick.Native.nuspec"
  $xml = [xml](Get-Content $path)

  $xml.package.metadata.copyright = "Copyright 2013-$((Get-Date).year) Dirk Lemstra"
  $xml.package.metadata.version = $version

  $nuspecFile = FullPath "publish\dotnet\files\Magick.Native.nuspec"
  $xml.Save($nuspecFile)

  & nuget pack $nuspecFile -NoPackageAnalysis

  Remove-Item $destination -Recurse -ErrorAction Ignore
  [void](New-Item -ItemType directory -Path $destination)
  Copy-Item "*.nupkg" $destination
}

createNuGetPackage $version $destination
