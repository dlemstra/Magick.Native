@echo off

call set.bash.cmd

if not ERRORLEVEL 1 (
    %BASH% --login -i -c "./update.imagemagick.sh"
)

