@echo off

set "SCRIPT_DIR=%~dp0"

set quantumName=%1
set architecture=%2

if "%quantumName%"=="" goto invalid
if "%architecture%"=="" goto invalid

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
