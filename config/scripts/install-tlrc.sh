#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/tldr-pages/tlrc/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=tlrc-v${VERSION}-x86_64-unknown-linux-gnu.tar.gz

curl -OL "https://github.com/tldr-pages/tlrc/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v "tlrc-v${VERSION}-x86_64-unknown-linux-gnu/tldr" /usr/bin
