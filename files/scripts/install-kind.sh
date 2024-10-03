#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o kind https://github.com/kubernetes-sigs/kind/releases/latest/download/kind-linux-amd64
chmod +x kind
mv -v kind /usr/bin/
