@echo off

set image=ubuntu:latest

docker run -v %~dp0../:/build %image% /build/shared/install.verify.dependencies.sh && /build/shared/verify.Native.sh linux x64 /build/linux/output OpenMP
