@echo off

set "SCRIPT_DIR=%~dp0"

call "%SCRIPT_DIR%..\..\.github\build\windows\find-bash.cmd"

%BASH% --login -i -c "./checkout.sh"
