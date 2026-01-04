#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o witr https://github.com/pranshuparmar/witr/releases/latest/download/witr-linux-amd64
chmod +x witr
mv -v witr /usr/bin/
