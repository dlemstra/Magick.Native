# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [parameter(mandatory=$true)][string]$destination
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function createNpmPackage($now)
{
  $info = $now.split('.')
  $version = "0.$($info[0])$($info[1]).$($info[2])$($info[3])"

  $path = FullPath "publish\wasm\package.json"
  $content = [IO.File]::ReadAllText($path)
  $content = $content.replace("""version"": """"", """version"": ""$version""")

  $packageJson = FullPath "publish\wasm\files\package.json"
  [IO.File]::WriteAllText($packageJson, $content)

  $dir = FullPath "publish\wasm\files"
  cd $dir
  & npm pack
}

$now = (Get-Date).ToUniversalTime().ToString("yyyy.MM.dd.HHmm")
createNpmPackage $now
