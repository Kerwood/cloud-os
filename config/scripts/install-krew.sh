#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz
tar -zxvf krew-linux_amd64.tar.gz
mv -v krew-linux_amd64 /usr/bin/krew
