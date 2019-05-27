@echo off

docker build ../.. -f Dockerfile.wasm -t magick-wasm
docker run -it -v %~dp0output:/output magick-wasm /src/build/copy.output.sh