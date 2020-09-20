@echo off

docker build ../.. -f Dockerfile -t magick-linux
docker run -v %~dp0output:/output -w /Magick.Native magick-linux /build/copy.Native.sh /output