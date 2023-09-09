@echo off

set config=linux-musl
set arch=x64
rem set openmp=OpenMP

set image=alpine:latest
rem set image=mcr.microsoft.com/dotnet/aspnet:5.0-alpine
rem set image=mcr.microsoft.com/dotnet/runtime:3.1-alpine
rem set image=mcr.microsoft.com/dotnet/runtime:5.0-alpine

docker run -v %~dp0../:/build %image% /bin/sh -c "apk update ; apk add bash ; /build/shared/verify.Native.sh /build/%config%-%arch%/output %config% %arch% %openmp%"
