#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/quantumsheep/sshs/releases/latest/download/sshs-linux-amd64

chmod +x sshs-linux-amd64
mv -v sshs-linux-amd64 /usr/bin/sshs
