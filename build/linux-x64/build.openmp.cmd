@echo off

docker build -f Dockerfile -t magick-linux-openmp --build-arg OpenMP=OpenMP ../..
docker run -v %~dp0output:/output -w /Magick.Native magick-linux-openmp /build/shared/copy.Native.sh linux x64 /output OpenMP
