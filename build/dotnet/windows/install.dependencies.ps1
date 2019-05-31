$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$targetNugetExe = "$PSScriptRoot\tools\nuget.exe"
Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe

$env:AMDAPPSDKROOT = "$env:BUILD_SOURCESDIRECTORY\src\ImageMagick\includes"