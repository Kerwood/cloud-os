#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/digitalocean/doctl/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=doctl-${VERSION}-linux-amd64.tar.gz

curl -OL "https://github.com/digitalocean/doctl/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v doctl /usr/bin
