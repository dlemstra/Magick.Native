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

. $PSScriptRoot\..\..\..\tools\windows\utils.ps1

function patchMagickBaseConfig($name, $platform) {
    $configFile = fullPath "src\ImageMagick\libraries\ImageMagick\MagickCore\magick-baseconfig.h"
    $config = [IO.File]::ReadAllText($configFile, [System.Text.Encoding]::Default)

    $config = $config.Replace("//#define MAGICKCORE_LIBRARY_NAME `"MyImageMagick.dll`"", "#define MAGICKCORE_LIBRARY_NAME `"Magick.Native-" + $name + "-" + $platform + ".dll`"")
    [IO.File]::WriteAllText($configFile, $config, [System.Text.Encoding]::Default)
}

function createSolution($quantum, $configureOptions) {
    $solutionFile = fullPath "src\ImageMagick\libraries\VisualMagick\VisualStaticMT.sln"

    if (Test-Path $solutionFile)
    {
        Remove-Item $solutionFile
    }

    $location = $(Get-Location)
    $path = fullPath "src\ImageMagick\libraries\VisualMagick\configure"
    Set-Location $path

    Start-Process .\configure.exe -ArgumentList "/smt /noWizard /VS2017 /$quantum $configureOptions" -wait

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
    Copy-Item "$source\jpeg\*.h" "$destination\jpeg"
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
    } else {
        Copy-Item "$source\*RL*.lib" $destination
    }
}

function copyOutput($config, $name) {
    $folder = "$config$name"
    copyIncludes $folder
    copyResources $folder
    copyLibraries $config $folder
}

function buildImageMagick($config, $name, $platform, $quantum, $configureOptions) {
    Write-Host ""
    Write-Host "Static Multi-Threaded DLL runtimes ($quantum-$platform)."

    createSolution $quantum $configureOptions
    patchMagickBaseConfig $name $platform

    $platformName = "Win32"
    if ($platform -eq "x64")
    {
        $platformName = "x64";
    }

    $options = "Configuration=$config,Platform=$($platformName),PlatformToolset=v141,VCBuildAdditionalOptions=/#arch:SSE"
    buildSolution "src\ImageMagick\libraries\VisualMagick\VisualStaticMT.sln" $options
    copyOutput $config $name
}

function buildConfigure() {
    buildSolution "src\ImageMagick\libraries\VisualMagick\configure\configure.sln" "Configuration=Release,Platform=Win32,PlatformToolset=v141"
}

buildConfigure
buildImageMagick "Release" "Q8" "x86" "Q8" "/opencl /noHdri /noOpenMP"
buildImageMagick "Release" "Q8" "x64" "Q8" "/opencl /noHdri /noOpenMP /x64"
buildImageMagick "Release" "Q8-OpenMP" "x64" "Q8" "/opencl /noHdri /x64"
buildImageMagick "Release" "Q16" "x86" "Q16" "/opencl /noHdri /noOpenMP"
buildImageMagick "Release" "Q16" "x64" "Q16" "/opencl /noHdri /noOpenMP /x64"
buildImageMagick "Release" "Q16-OpenMP" "x64" "Q16" "/opencl /noHdri /x64"
buildImageMagick "Release" "Q16-HDRI" "x86" "Q16-HDRI" "/opencl /noOpenMP"
buildImageMagick "Release" "Q16-HDRI" "x64" "Q16-HDRI" "/opencl /noOpenMP /x64"
buildImageMagick "Release" "Q16-HDRI-OpenMP" "x64" "Q16-HDRI" "/opencl /x64"
