#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/stern/stern/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=stern_${VERSION}_linux_amd64.tar.gz

curl -OL "https://github.com/stern/stern/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v stern /usr/bin
