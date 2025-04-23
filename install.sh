#!/bin/bash
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/icons
mkdir -p ~/.local/share/applications
curl -s https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/plin -o ~/.local/bin/plin
chmod +x ~/.local/bin/plin
curl -s https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/plin.svg -o ~/.local/share/icons/plin.svg
curl -s https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/plin.desktop -o ~/.local/share/applications/plin.desktop
update-desktop-database ~/.local/share/applications/
