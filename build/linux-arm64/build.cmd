@echo off

docker build -f Dockerfile -t magick-linux-arm64 ../..
docker run -v %~dp0output:/output -w /Magick.Native magick-linux-arm64 /build/shared/copy.Native.sh linux arm64 /output
