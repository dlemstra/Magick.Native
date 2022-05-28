@echo off

docker build ../.. -f Dockerfile -t magick-wasm
docker run -it -v %~dp0output:/output -w /Magick.Native magick-wasm /build/copy.Native.sh /output
