#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar -zxvf zellij-x86_64-unknown-linux-musl.tar.gz
./zellij setup --dump-config > /usr/dotfiles/zellij/config.kdl
mv -v zellij /usr/bin
