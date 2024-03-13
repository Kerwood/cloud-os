#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=lazydocker_${VERSION}_Linux_x86_64.tar.gz


curl -OL "https://github.com/jesseduffield/lazydocker/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v lazydocker /usr/bin
