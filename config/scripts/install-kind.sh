#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/metalbear-co/kubernetes-sigs/kind/latest/download/kind-linux-amd64
chmod +x kind-linux-amd64
mv -v kind-linux-amd64 /usr/bin/kind
