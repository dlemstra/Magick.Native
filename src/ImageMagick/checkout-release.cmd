@echo off

set "SCRIPT_DIR=%~dp0"

set architecture=%1
set openMP=%2

call "%SCRIPT_DIR%..\..\.github\build\windows\find-bash.cmd"

%BASH% --login -i -c "./checkout.sh --dependencies-artifact windows-%architecture%-static-%openMP%-linked-runtime.zip"
