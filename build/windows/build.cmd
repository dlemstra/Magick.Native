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
echo Running configure with the following options: %options%
Configure.Release.x64.exe %options%

if %ERRORLEVEL% neq 0 (
    cd %SCRIPT_DIR%
    exit /b %ERRORLEVEL%
)

cd ..

set quantumName=%quantum%
if not "%hdri%"=="noHdri" set quantumName=%quantumName%-HDRI
if not "%openMP%"=="noOpenMP" set quantumName=%quantumName%-OpenMP

set library_name=Magick.Native-%quantumName%-%architecture%.dll
echo ^<Project^>^<ItemDefinitionGroup Condition="'$(MSBuildProjectName)' == 'CORE_MagickCore'"^>^<ClCompile^>^<PreprocessorDefinitions^>%%(PreprocessorDefinitions);MAGICKCORE_LIBRARY_NAME="%library_name%"^</PreprocessorDefinitions^>^</ClCompile^>^</ItemDefinitionGroup^>^</Project^> > Directory.Build.targets

msbuild IM7.Static.%architecture%.sln /m /t:Rebuild /p:Configuration=%config%,Platform=%architecture%

if %ERRORLEVEL% neq 0 (
    cd %SCRIPT_DIR%
    exit /b %ERRORLEVEL%
)

cd ..\..

set configuration=%config%%quantumName%

msbuild Magick.Native.sln /m /t:Rebuild /p:Configuration=%configuration%,Platform=%architecture%

if %ERRORLEVEL% neq 0 (
    cd %SCRIPT_DIR%
    exit /b %ERRORLEVEL%
)

goto done

:invalid

echo.
echo Do not use this script directly.
echo.

:done

cd %SCRIPT_DIR%
