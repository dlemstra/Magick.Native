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
  return "$PSScriptRoot\..\..\..\$path"
}

function buildSolution($solution, $properties)
{
    $path = fullPath $solution
    $directory = Split-Path -parent $path
    $filename = Split-Path -leaf $path

    & "$PSScriptRoot\tools\nuget.exe" restore $path

    $location = $(Get-Location)
    Set-Location $directory

    msbuild $filename /t:Rebuild ("/p:$($properties)")
    checkExitCode "Failed to build: $($path)"

    Set-Location $location
}