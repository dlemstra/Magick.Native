#!/bin/bash
set -e

commit=$(git ls-remote https://github.com/ImageMagick/ImageMagick.git HEAD)
commit=${commit:0:40}
echo "Update ImageMagick commit to: $commit"
echo -n $commit > ImageMagick.commit
