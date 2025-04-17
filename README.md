# Plin
Simple day planning software for Linux using GTK4, inspired by SuperMemo Plan

## Installation
```
sudo apt install -y python-gi-dev libgtk-4-dev libadwaita-1-dev
curl -s https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/plin -o ~/.local/bin/plin
chmod +x ~/.local/bin/plin
curl -s https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/plin.desktop -o ~/.local/share/applications/plin.desktop
update-desktop-database ~/.local/share/applications/
```

## Future
- [ ] Second checkbox (R) functionality
- [ ] CalDAV syncing
- [ ] Saving and opening
