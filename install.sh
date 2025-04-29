#!/bin/bash
GITHUB_REPO="https://raw.githubusercontent.com/connor5043/Plin/refs/heads/main"
if [[ $(uname -s) == "Darwin" ]]; then
	BUNDLE_LOCATION="~/Applications/Plin.app/Contents"
	command -v python3 >/dev/null 2>&1 || { echo "Python 3 is required but not installed. Install it using Homebrew: brew install python3"; exit 1; }
	python3 -c "import tkinter" 2>/dev/null || { echo "Python tkinter is required but not installed. Install it using Homebrew: brew install python-tk"; exit 1; }
	mkdir -p ${BUNDLE_LOCATION}/MacOS
	mkdir -p ${BUNDLE_LOCATION}/Resources
	curl -s ${GITHUB_REPO}/plin -o ${BUNDLE_LOCATION}/MacOS/plin
	chmod +x ${BUNDLE_LOCATION}/MacOS/plin
	curl -s ${GITHUB_REPO}/Info.plist -o ${BUNDLE_LOCATION}/Info.plist
	curl -s ${GITHUB_REPO}/plin.svg -o ${BUNDLE_LOCATION}/Resources/icon.svg
	sips -s format icns ${BUNDLE_LOCATION}/Resources/icon.svg --out ${BUNDLE_LOCATION}/Resources/app-icon.icns >/dev/null 2>&1
	rm ${BUNDLE_LOCATION}/Resources/icon.svg
else
	mkdir -p ~/.local/bin
	mkdir -p ~/.local/share/icons
	mkdir -p ~/.local/share/applications
	curl -s ${GITHUB_REPO}/plin -o ~/.local/bin/plin
	chmod +x ~/.local/bin/plin
	curl -s ${GITHUB_REPO}/plin.svg -o ~/.local/share/icons/plin.svg
	curl -s ${GITHUB_REPO}/plin.desktop -o ~/.local/share/applications/plin.desktop
	update-desktop-database ~/.local/share/applications/
fi
