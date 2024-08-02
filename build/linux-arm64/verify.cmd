@echo off

set config=linux
set arch=arm64
rem set openmp=OpenMP

set image=mcr.microsoft.com/dotnet/runtime:6.0-focal-arm64v8
rem set image=public.ecr.aws/lambda/dotnet:6-arm64

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker run -v %~dp0../:/build %image% /build/shared/verify.Native.sh /build/%config%-%arch%/artifacts %config% %arch% %openmp%
