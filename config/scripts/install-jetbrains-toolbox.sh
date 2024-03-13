#!/usr/bin/env bash

set -euo pipefail

curl -JL -o toolbox.tar.gz "https://download.jetbrains.com/product?code=TB&latest&distribution=linux"
tar -zxvf toolbox.tar.gz
mv jetbrains-toolbox*/jetbrains-toolbox /usr/bin/

cat << EOF > /usr/share/applications/jetbrains-toolbox.desktop
[Desktop Entry]
Icon=/usr/share/JetBrains/Toolbox/toolbox.svg
Exec=/usr/bin/jetbrains-toolbox %u
Version=1.0
Type=Application
Categories=Development
Name=JetBrains Toolbox
StartupWMClass=jetbrains-toolbox
Terminal=false
MimeType=x-scheme-handler/jetbrains;
X-GNOME-Autostart-enabled=true
StartupNotify=false
X-GNOME-Autostart-Delay=10
X-MATE-Autostart-Delay=10
X-KDE-autostart-after=panel
EOF
