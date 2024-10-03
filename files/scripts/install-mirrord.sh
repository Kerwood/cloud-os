#!/usr/bin/env bash

set -euo pipefail

curl -sSL -o mirrord https://github.com/metalbear-co/mirrord/releases/latest/download/mirrord_linux_x86_64
chmod +x mirrord
mv -v mirrord /usr/bin/
