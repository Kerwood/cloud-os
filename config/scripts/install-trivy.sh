#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/aquasecurity/trivy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=trivy_${VERSION}_Linux-64bit.tar.gz

curl -OL "https://github.com/aquasecurity/trivy/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v trivy /usr/bin
