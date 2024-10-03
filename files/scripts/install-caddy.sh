#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/caddyserver/caddy/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=caddy_${VERSION}_linux_amd64.tar.gz

curl -OL "https://github.com/caddyserver/caddy/releases/download/v${VERSION}/${FILENAME}"
tar -zxvf "$FILENAME"
mv -v caddy /usr/bin
