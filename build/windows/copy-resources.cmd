@echo off
setlocal

set "SCRIPT_DIR=%~dp0"

set folder=%1
set quantumName=%2
set architecture=%3

if "%folder%"=="" goto invalid
if "%quantumName%"=="" goto invalid
if "%architecture%"=="" goto invalid

if not exist "%folder%" mkdir "%folder%"

cd "%folder%"

if not exist "resources" mkdir "resources"
cd resources

if not exist "%quantumName%" mkdir "%quantumName%"

cd %quantumName%

if not exist "%architecture%" mkdir "%architecture%"

cd %architecture%

copy /Y "%SCRIPT_DIR%..\..\src\ImageMagick\Artifacts\bin\*.xml" .
copy /Y "%SCRIPT_DIR%..\..\src\Magick.Native\Resources\xml\*.xml" .

goto done

:invalid

echo.
echo Do not use this script directly.
echo.
exit /b 1

:done

cd %SCRIPT_DIR%
