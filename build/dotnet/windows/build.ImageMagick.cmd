@echo off
call "..\..\..\tools\windows\init.visualstudio.cmd"

powershell .\build.ImageMagick.ps1 -quantumName Q8 -platform x86