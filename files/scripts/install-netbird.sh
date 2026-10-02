#!/usr/bin/env bash

set -euo pipefail

rpm --import https://pkgs.netbird.io/yum/repodata/repomd.xml.key

cat << EOF | tee /etc/yum.repos.d/netbird.repo
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

# The netbird %post scriptlet runs `netbird service install/start`, which fails
# without a running systemd and aborts the transaction. Install it without
# scriptlets; the unit ships in files/system/usr/lib/systemd/system instead.
# netbird-ui is installed by the rpm-ostree module.
dnf install -y --setopt=tsflags=noscripts netbird
