docker build ../../.. -f Dockerfile -t magick-wasm-linux
docker run -it -v $PWD/output:/output -w /Magick.Native magick-wasm-linux /build/copy.Native.sh /output