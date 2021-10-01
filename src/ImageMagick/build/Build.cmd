@echo off
call "..\..\..\tools\windows\init.visualstudio.cmd"

set config=%1
set quantumName=%2
set platformName=%3

if "%config%"=="" goto invalid
if "%quantumName%"=="" goto invalid
if "%platformName%"=="" goto invalid

cd ..\..\..\build\windows\

powershell .\build.ImageMagick.ps1 -config %config% -quantumName %quantumName% -platformName %platformName%

goto done

:invalid

echo.
echo Do not use this script directly.
echo.

:done

pause