#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x argocd
mv -v argocd /usr/bin/
