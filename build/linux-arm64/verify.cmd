@echo off

set image=arm64v8/ubuntu

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker run -v %~dp0:/build %image% /build/verify.Native.sh /build/output
