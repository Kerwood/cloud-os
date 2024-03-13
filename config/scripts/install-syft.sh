#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/anchore/syft/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=syft_${VERSION}_linux_amd64.rpm

curl -OL "https://github.com/anchore/syft/releases/download/v${VERSION}/${FILENAME}"
rpm -i "$FILENAME"
