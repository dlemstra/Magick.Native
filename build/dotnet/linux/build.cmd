@echo off

docker build ../../.. -f Dockerfile -t magick-dotnet-linux
docker run -v %~dp0output:/output -w /Native magick-dotnet-linux /build/copy.Native.sh /output