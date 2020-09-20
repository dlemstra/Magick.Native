@echo off

set image=ubuntu:latest

docker run -v %~dp0:/build %image% /build/verify.Native.sh /build/output