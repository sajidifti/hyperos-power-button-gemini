#!/usr/bin/env sh
set -eu

VERSION=$(sed -n 's/^version=//p' module/module.prop)
OUTPUT="HyperOS-Power-Button-Gemini-v${VERSION}.zip"
mkdir -p dist
rm -f "dist/$OUTPUT"
(cd module && zip -qr "../dist/$OUTPUT" .)
echo "Created dist/$OUTPUT"
