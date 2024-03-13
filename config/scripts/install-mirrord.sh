#!/usr/bin/env bash

set -euo pipefail

curl -LO https://github.com/metalbear-co/mirrord/releases/latest/download/mirrord_linux_x86_64
chmod +x mirrord_linux_x86_64
mv -v mirrord_linux_x86_64 /usr/bin/mirrord
