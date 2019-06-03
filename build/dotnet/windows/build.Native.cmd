@echo off
call "..\..\..\tools\windows\init.visualstudio.cmd"

powershell .\build.Native.ps1 -quantumName Q8 -platform x86