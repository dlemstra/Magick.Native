@echo off

powershell .\copy.Native.ps1 -quantumName Q8 -platform x86 -destination output
if %errorlevel% neq 0 exit /b %errorlevel%