@echo off

set config=linux
set arch=x64
rem set openmp=OpenMP

set image=ubuntu:16.04
rem set image=ubuntu:16.04
rem set image=ubuntu:18.04
rem set image=ubuntu:20.04
rem set image=ubuntu:latest
rem set image=tgagor/centos:stream8
rem set image=tgagor/centos:stream9
rem set image=mcr.microsoft.com/dotnet/aspnet:latest
rem set image=mcr.microsoft.com/dotnet/runtime:3.1
rem set image=mcr.microsoft.com/dotnet/runtime:latest
rem set image=amazon/aws-lambda-dotnet:6
rem set image=public.ecr.aws/lambda/dotnet:6-x86_64

docker run -v %~dp0../:/build %image% /build/shared/verify.Native.sh /build/%config%-%arch%/output %config% %arch% %openmp%
