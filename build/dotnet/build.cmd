@echo off

docker build ../.. -f Dockerfile.dotnet -t magick-dotnet
docker run -it -v %~dp0output:/output magick-dotnet /src/build/copy.output.sh