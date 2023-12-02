@echo off

set BASH="%PROGRAMFILES%\Git\bin\bash.exe"
if exist %BASH% goto FOUND

set bash="%PROGRAMFILES(x86)%\Git\bin\bash.exe"
if exist %BASH% goto FOUND

echo Failed to find bash.exe
echo %BASH%
exit /b 1

:FOUND
