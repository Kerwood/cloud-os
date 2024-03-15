#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o kind https://github.com/metalbear-co/kubernetes-sigs/kind/latest/download/kind-linux-amd64
chmod +x kind
mv -v kind /usr/bin/
