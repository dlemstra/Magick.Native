@echo off

docker build -f Dockerfile -t magick-linux-musl-openmp --build-arg OpenMP=OpenMP ../..
docker run -v %~dp0output:/output -w /Magick.Native magick-linux-musl-openmp /build/shared/copy.Native.sh linux-musl x64 /output OpenMP
