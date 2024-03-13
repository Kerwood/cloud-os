#!/usr/bin/env bash

set -euo pipefail

VERSION=$(curl -sL "https://api.github.com/repos/charmbracelet/gum/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
FILENAME=gum_${VERSION}_Linux_x86_64

curl -OL "https://github.com/charmbracelet/gum/releases/download/v${VERSION}/${FILENAME}.tar.gz"
tar -zxvf "$FILENAME.tar.gz"
mv -v gum /usr/bin
