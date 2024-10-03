#!/usr/bin/env bash

set -euo pipefail

FOLDERNAME="atuin-x86_64-unknown-linux-gnu"
curl -LO https://github.com/atuinsh/atuin/releases/latest/download/$FOLDERNAME.tar.gz
tar -zxvf $FOLDERNAME.tar.gz
mv -v $FOLDERNAME/atuin /usr/bin
