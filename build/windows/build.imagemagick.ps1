# Copyright Dirk Lemstra https://github.com/dlemstra/Magick.NET.
# Licensed under the Apache License, Version 2.0.

param (
    [string]$config = "Release",
    [string]$quantumName = $env:QuantumName,
    [string]$platformName = $env:PlatformName
)

. $PSScriptRoot\..\..\tools\windows\utils.ps1

function patchMagickBaseConfig($name, $platformName) {
    $configFile = fullPath "src\ImageMagick\imagemagick-windows\ImageMagick\MagickCore\magick-baseconfig.h"
    $config = [IO.File]::ReadAllText($configFile, [System.Text.Encoding]::Default)

    $config = $config.Replace("//#define MAGICKCORE_LIBRARY_NAME `"MyImageMagick.dll`"", "#define MAGICKCORE_LIBRARY_NAME `"Magick.Native-" + $name + "-" + $platformName + ".dll`"")
    [IO.File]::WriteAllText($configFile, $config, [System.Text.Encoding]::Default)
}

function createSolution($configureOptions) {
    $location = $(Get-Location)
    $path = fullPath "src\ImageMagick\imagemagick-windows\Configure"
    Set-Location $path

    $options = "/smt /noWizard /VS2022 $configureOptions"
    Write-Host "Options: $configureOptions"
    Start-Process .\configure.exe -ArgumentList $options -wait

    Set-Location $location
}

function copyIncludes($folder) {
    $source = fullPath "src\ImageMagick\imagemagick-windows"
    $destination = fullPath "src\ImageMagick\artifacts\includes\$folder"
    Remove-Item $destination -Recurse -ErrorAction Ignore
    [void](New-Item -ItemType directory -Path "$destination\MagickCore")
    Copy-Item "$source\ImageMagick\MagickCore\*.h" "$destination\MagickCore"
    [void](New-Item -ItemType directory -Path "$destination\MagickWand")
    Copy-Item "$source\ImageMagick\MagickWand\*.h" "$destination\MagickWand"
    [void](New-Item -ItemType directory -Path "$destination\jpeg")
    Copy-Item "$source\Dependencies\jpeg-turbo\*.h" "$destination\jpeg"
    [void](New-Item -ItemType directory -Path "$destination\coders")
    Copy-Item "$source\ImageMagick\coders\*-private.h" "$destination\coders"
    [void](New-Item -ItemType directory -Path "$destination\CL")
    Copy-Item "$source\Build\OpenCL\CL\*.h" "$destination\CL"
}

function copyResources($folder) {
    $source = fullPath "src\ImageMagick\imagemagick-windows\Artifacts\bin"
    $destination = fullPath "src\ImageMagick\artifacts\resources\$folder"
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
    $source = fullPath "src\ImageMagick\imagemagick-windows\Artifacts\lib"
    $destination = fullPath "src\ImageMagick\artifacts\libraries\$folder"
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

function copyArtifacts($config, $name, $platformName) {
    $folder = "$config$name\$platformName"
    copyIncludes $folder
    copyResources $folder
    copyLibraries $config $folder
}

function getConfigureOptions($name, $platformName, $quantum) {
    $options = "/$quantum /opencl /noDpc"
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
    build "src\ImageMagick\imagemagick-windows\IM7.Static.$($platformName).sln" $options
    copyArtifacts $config $name $platformName
}

buildImageMagick $config $quantumName $platformName
