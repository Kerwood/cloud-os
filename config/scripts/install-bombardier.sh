#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o bombardier https://github.com/codesenberg/bombardier/releases/latest/download/bombardier-linux-amd64
chmod +x bombardier
mv -v bombardier /usr/bin/
