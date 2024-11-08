@echo off
call "..\..\tools\windows\init.visualstudio.cmd"

powershell .\build.configure.ps1
if %errorlevel% neq 0 exit /b %errorlevel%
