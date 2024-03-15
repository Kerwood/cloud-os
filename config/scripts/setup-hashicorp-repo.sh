#!/usr/bin/env bash

set -oue pipefail

cat << \EOF | tee /etc/yum.repos.d/hashicorp.repo
[hashicorp]
name=Hashicorp Stable - $basearch
baseurl=https://rpm.releases.hashicorp.com/fedora/$releasever/$basearch/stable
enabled=1
gpgcheck=0
gpgkey=https://rpm.releases.hashicorp.com/gpg
EOF
