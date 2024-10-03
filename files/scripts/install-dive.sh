#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=dive_${VERSION}_linux_amd64.rpm

curl -OL "https://github.com/wagoodman/dive/releases/download/v${VERSION}/${FILENAME}"
rpm -i "$FILENAME"
