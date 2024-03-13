#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/atuinsh/atuin/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=atuin-v${VERSION}-x86_64-unknown-linux-gnu.tar.gz

curl -OL "https://github.com/atuinsh/atuin/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v "atuin-v${VERSION}-x86_64-unknown-linux-gnu/atuin" /usr/bin
