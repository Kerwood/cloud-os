#!/usr/bin/env bash

set -euo pipefail

curl -LO https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/paping/paping_1.5.5_x86-64_linux.tar.gz
tar -zxvf paping_1.5.5_x86-64_linux.tar.gz
mv -v paping /usr/bin/
