@echo off
setlocal

set "SCRIPT_DIR=%~dp0"

set folder=%1

if "%folder%"=="" goto invalid

if not exist "%folder%" (
    echo Warning: folder "%folder%" does not exist.
    exit /b 1
)

cd "%folder%"

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
