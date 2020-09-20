@echo off

docker build ../.. -f Dockerfile -t magick-dotnet-linux
docker run -v %~dp0output:/output -w /Magick.Native magick-dotnet-linux /build/copy.Native.sh /output