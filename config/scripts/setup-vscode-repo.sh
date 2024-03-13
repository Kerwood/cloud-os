#!/usr/bin/env bash

set -oue pipefail

rpm --import https://packages.microsoft.com/keys/microsoft.asc

cat << EOF | tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
