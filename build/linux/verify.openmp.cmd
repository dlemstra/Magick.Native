@echo off

set image=ubuntu:latest

docker run -v %~dp0../:/build %image% /build/shared/verify.Native.sh linux /build/linux/output OpenMP
