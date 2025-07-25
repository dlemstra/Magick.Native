@echo off
call "..\..\tools\windows\init.visualstudio.cmd"

set "SCRIPT_DIR=%~dp0"

set config=%1
set quantum=%2
set architecture=%3
set hdri=%4
set openMP=%5

if "%config%"=="" goto invalid
if "%quantum%"=="" goto invalid
if "%architecture%"=="" goto invalid
if "%hdri%"=="" goto invalid
if "%openMP%"=="" goto invalid

cd ..\..\src\ImageMagick\Configure

set options=/noWizard /VS2022 /static /%quantum% /opencl /noDpc /%hdri% /%openMP% /%architecture% /linkRuntime
echo "Running configure with the following options: %options%"
Configure.Release.x64.exe %options%

cd ..

msbuild IM7.Static.%architecture%.sln /m /t:Rebuild /p:Configuration=%config%,Platform=%architecture%

cd ..\..

set configuration=%config%%quantum%
if not "%hdri%"=="noHdri" set configuration=%configuration%-HDRI
if not "%openMP%"=="noOpenMP" set configuration=%configuration%-OpenMP

msbuild Magick.Native.sln /m /t:Rebuild /p:Configuration=%configuration%,Platform=%architecture%

goto done

:invalid

echo.
echo Do not use this script directly.
echo.

:done

cd %SCRIPT_DIR%
