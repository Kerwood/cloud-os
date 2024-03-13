#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_amd64.tar.gz
tar -zxvf k9s_Linux_amd64.tar.gz
mv -v k9s /usr/bin
