#!/usr/bin/env bash
set -o errexit \
    -o nounset \
    -o pipefail

nix build

VERSION=$(result/bin/glualint --version)
echo "Packing glualint version $VERSION"

cp result/bin/glualint .

zip "glualint-$VERSION-x86_64-linux.zip" glualint

rm -f glualint
