#!/usr/bin/env bash

set -oue pipefail

echo 'installing appimagelauncher'
wget 'https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm'
sudo rpm-ostree install -y appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
