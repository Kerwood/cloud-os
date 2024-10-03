#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o sshs https://github.com/quantumsheep/sshs/releases/latest/download/sshs-linux-amd64
chmod +x sshs
mv -v sshs /usr/bin/
