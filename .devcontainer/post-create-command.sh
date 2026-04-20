#!/bin/bash
set -e

cd src/Magick.Native
../../build/shared/build.native.sh $DC_CONFIG $DC_ARCH $DC_QUANTUM $DC_OPEN_MP
../../build/shared/copy.native.sh ../../build/$DC_CONFIG-$DC_ARCH-$DC_QUANTUM/artifacts $DC_CONFIG $DC_ARCH $DC_QUANTUM $DC_OPEN_MP
