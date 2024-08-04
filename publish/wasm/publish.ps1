# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [parameter(mandatory=$true)][string]$version
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function createNpmPackage($version)
{
  $path = FullPath "publish\wasm\package.json"
  $content = [IO.File]::ReadAllText($path)
  $content = $content.replace("""version"": """"", """version"": ""$version""")

  $packageJson = FullPath "publish\wasm\files\package.json"
  [IO.File]::WriteAllText($packageJson, $content)

  $dir = FullPath "publish\wasm\files"
  cd $dir
  & npm pack
}

createNpmPackage $version
