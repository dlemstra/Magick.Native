@echo off

set image=ubuntu:16.04

docker run -v %~dp0../:/build %image% /build/shared/verify.Native.sh linux x64 /build/linux-x64/output
