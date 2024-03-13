#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/argoproj/argo-cd/kind/latest/download/argocd-linux-amd64
chmod +x argocd-linux-amd64
mv -v argocd-linux-amd64 /usr/bin/argocd
