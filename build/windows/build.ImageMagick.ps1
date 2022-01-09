# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [string]$config = "Release",
    [string]$quantumName = $env:QuantumName,
    [string]$platformName = $env:PlatformName
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function patchMagickBaseConfig($name, $platformName) {
    $configFile = fullPath "src\ImageMagick\libraries\ImageMagick\MagickCore\magick-baseconfig.h"
    $config = [IO.File]::ReadAllText($configFile, [System.Text.Encoding]::Default)

    $config = $config.Replace("//#define MAGICKCORE_LIBRARY_NAME `"MyImageMagick.dll`"", "#define MAGICKCORE_LIBRARY_NAME `"Magick.Native-" + $name + "-" + $platformName + ".dll`"")
    [IO.File]::WriteAllText($configFile, $config, [System.Text.Encoding]::Default)
}

function createSolution($configureOptions) {
    $solutionFile = fullPath "src\ImageMagick\libraries\VisualMagick\VisualStaticMT.sln"

    if (Test-Path $solutionFile)
    {
        Remove-Item $solutionFile
    }

    $location = $(Get-Location)
    $path = fullPath "src\ImageMagick\libraries\VisualMagick\configure"
    Set-Location $path

    $options = "/smt /noWizard /VS2022 $configureOptions"
    Write-Host "Options: $configureOptions"
    Start-Process .\configure.exe -ArgumentList $options -wait

    Set-Location $location
}

function copyIncludes($folder) {
    $source = fullPath "src\ImageMagick\libraries"
    $destination = fullPath "src\ImageMagick\output\includes\$folder"
    Remove-Item $destination -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path "$destination\MagickCore")
    Copy-Item "$source\ImageMagick\MagickCore\*.h" "$destination\MagickCore"
    [void](New-Item -ItemType directory -Path "$destination\MagickWand")
    Copy-Item "$source\ImageMagick\MagickWand\*.h" "$destination\MagickWand"
    [void](New-Item -ItemType directory -Path "$destination\jpeg")
    Copy-Item "$source\jpeg-turbo\*.h" "$destination\jpeg"
    [void](New-Item -ItemType directory -Path "$destination\coders")
    Copy-Item "$source\ImageMagick\coders\*-private.h" "$destination\coders"
    [void](New-Item -ItemType directory -Path "$destination\CL")
    Copy-Item "$source\VisualMagick\OpenCL\CL\*.h" "$destination\CL"
}

function copyResources($folder) {
    $source = fullPath "src\ImageMagick\libraries\VisualMagick\bin"
    $destination = fullPath "src\ImageMagick\output\resources\$folder"
    Remove-Item $destination -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path "$destination")
    foreach ($xmlFile in [IO.Directory]::GetFiles($source, "*.xml")) {
        $fileName = [IO.Path]::GetFileName($xmlFile)
        if (($fileName -eq "log.xml") -or ($fileName -eq "policy.xml")) {
              continue
        }
        Copy-Item $xmlFile $destination\$fileName
    }
}

function copyLibraries($config, $folder) {
    $source = fullPath "src\ImageMagick\libraries\VisualMagick\lib"
    $destination = fullPath "src\ImageMagick\output\libraries\$folder"
    Remove-Item $destination -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path $destination)
    if ($config -eq "Debug") {
        Copy-Item "$source\*DB*.lib" $destination
        Copy-Item "$source\*DB*.pdb" $destination
    } else {
        Copy-Item "$source\*RL*.lib" $destination
        Copy-Item "$source\*RL*.pdb" $destination
    }
}

function copyOutput($config, $name, $platformName) {
    $folder = "$config$name\$platformName"
    copyIncludes $folder
    copyResources $folder
    copyLibraries $config $folder
}

function getConfigureOptions($name, $platformName, $quantum) {
    $options = "/$quantum /opencl"
    if ($name -inotmatch "-HDRI") {
        $options = "$options /noHdri"
    }
    if ($name -inotmatch "-OpenMP") {
        $options = "$options /noOpenMP"
    }
    $options = "$options /$platformName"

    return $options;
}

function buildImageMagick($config, $name, $platformName) {
    Write-Host ""
    Write-Host "Static Multi-Threaded DLL runtimes ($name-$platformName)."

    $quantum = $name.split("-")[0]
    $configureOptions = getConfigureOptions $name $platformName $quantum

    createSolution $configureOptions
    patchMagickBaseConfig $name $platformName

    $options = "Configuration=$config,Platform=$($platformName),VCBuildAdditionalOptions=/#arch:SSE"
    build "src\ImageMagick\libraries\VisualMagick\VisualStaticMT.sln" $options
    copyOutput $config $name $platformName
}

function buildConfigure() {
    build "src\ImageMagick\libraries\VisualMagick\configure\configure.2022.sln" "Configuration=Release,Platform=x64"
}

buildConfigure
buildImageMagick $config $quantumName $platformName
