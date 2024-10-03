#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/ahmetb/kubectx/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=kubens_v${VERSION}_linux_x86_64.tar.gz

curl -OL "https://github.com/ahmetb/kubectx/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v kubens /usr/bin
