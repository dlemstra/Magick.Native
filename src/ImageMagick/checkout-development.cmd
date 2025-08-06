@echo off

set "SCRIPT_DIR=%~dp0"

call "%SCRIPT_DIR%..\..\tools\windows\find-bash.cmd"

%BASH% --login -i -c "./checkout.sh --development"
