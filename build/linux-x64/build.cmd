@echo off

docker build -f Dockerfile -t magick-linux ../..
docker run -v %~dp0output:/output -w /Magick.Native magick-linux /build/shared/copy.Native.sh linux x64 /output
