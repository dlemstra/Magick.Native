@echo off

docker build -f Dockerfile -t magick-linux-musl ../..
docker run -v %~dp0output:/output -w /Magick.Native magick-linux-musl /build/shared/copy.Native.sh linux-musl x64 /output
