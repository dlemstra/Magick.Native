@echo off
call "..\..\tools\windows\init.visualstudio.cmd"

powershell .\build.configure.ps1 -platformName %1
if %errorlevel% neq 0 exit /b %errorlevel%
