@echo off

set image=alpine:latest

docker run -v %~dp0../:/build %image% /bin/sh -c "apk update && apk add bash && /build/shared/install.verify.dependencies.sh && /build/shared/verify.Native.sh linux-musl x64 /build/linux-musl-x64/output OpenMP"
