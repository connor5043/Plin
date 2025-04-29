# Plin
Simple, lightweight day-planning application using Tk. Inspired by SuperMemo Plan

## Installation on macOS 🍏
python3-tk is required
```
curl -fsSL https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/gen-app-bundle.sh | bash
```
Move the generated Plin.app to /Applications.

## Installation on Linux 🐧
python3-tk and Xorg / Xwayland are required
```
curl -fsSL https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main/install.sh | bash
```

## Future
- [x] Lower resource utilization by switching GUI framework
- [x] Support / installation for other platforms
- [ ] Second checkbox (R) functionality
- [ ] CalDAV syncing
- [ ] Saving and opening
- [ ] Begin functionality
- [x] Dynamic updates to replace Update button

## Frequently unasked questions (FUQ for short)
**Q: When will there be native support for Wayland?**

A: Probably never because Tk won't support Wayland in the foreseeable future. I can't use Gtk or Qt because I don't want Plin to have more of a memory footprint than SuperMemo. Running Plin through Xwayland is still more resource-efficient than using those frameworks would be. Should the time ever come when Xwayland is completely deprecated (very unlikely) and Tk still doesn't support Wayland (even less likely), I guess I would have to rewrite this using SDL or something.
