#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/thomasschafer/scooter/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=scooter-v${VERSION}-x86_64-unknown-linux-musl


curl -OL "https://github.com/thomasschafer/scooter/releases/download/v${VERSION}/${FILENAME}.tar.gz"
tar -zxvf "$FILENAME.tar.gz"
mv -v "scooter" /usr/bin
