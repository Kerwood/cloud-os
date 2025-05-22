#!/usr/bin/env bash

set -euo pipefail

FOLDERNAME="eza_x86_64-unknown-linux-gnu"
curl -LO https://github.com/eza-community/eza/releases/latest/download/$FOLDERNAME.tar.gz
tar -zxvf $FOLDERNAME.tar.gz
mv -v eza /usr/bin
