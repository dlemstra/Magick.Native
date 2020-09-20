@echo off

set image=alpine:latest

docker run -v %~dp0:/build %image% /build/verify.Native.sh /build/output