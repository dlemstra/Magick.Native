@echo off

docker build ../.. -f Dockerfile -t magick-linux-openmp
docker run -v %~dp0output:/output -w /Magick.Native magick-linux-openmp /build/copy.Native.sh /output