#!/bin/bash

APP_NAME="Plin"
BUNDLE_NAME="${APP_NAME}.app"
EXECUTABLE="plin"
GITHUB_REPO="https://raw.githubusercontent.com/connor5043/Plin/main"
BIN_PATH="/usr/local/bin"

# Ensure Python 3 is installed
if ! command -v python3 >/dev/null 2>&1; then
    echo "Python 3 is required but not installed. Install it using Homebrew:"
    echo "brew install python3"
    exit 1
fi

# Ensure tkinter is installed
if ! python3 -c "import tkinter" 2>/dev/null; then
    echo "Python tkinter is required but not installed. Install it using Homebrew:"
    echo "brew install python-tk"
    exit 1
fi

# Download the `plin` script
echo "Downloading ${EXECUTABLE} from GitHub..."
curl -s "${GITHUB_REPO}/${EXECUTABLE}" -o "${EXECUTABLE}"
chmod +x "${EXECUTABLE}"

# Set up the .app bundle directory structure
echo "Creating ${BUNDLE_NAME} bundle..."
mkdir -p "${BUNDLE_NAME}/Contents/MacOS"
mkdir -p "${BUNDLE_NAME}/Contents/Resources"

# Move the `plin` executable into the .app bundle
mv "${EXECUTABLE}" "${BUNDLE_NAME}/Contents/MacOS/${EXECUTABLE}"

# Create an `Info.plist` file
cat <<EOF > "${BUNDLE_NAME}/Contents/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleName</key>
    <string>${APP_NAME}</string>
    <key>CFBundleDisplayName</key>
    <string>${APP_NAME}</string>
    <key>CFBundleIdentifier</key>
    <string>com.connor5043.${APP_NAME,,}</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleExecutable</key>
    <string>${EXECUTABLE}</string>
    <key>CFBundleIconFile</key>
    <string>app-icon</string>
</dict>
</plist>
EOF

# Optional: Add an app icon (if an .icns file is provided)
ICON_URL="${GITHUB_REPO}/plin.svg"
ICONS_FOLDER="${BUNDLE_NAME}/Contents/Resources"
ICON_NAME="app-icon.icns"

echo "Downloading app icon..."
curl -s "${ICON_URL}" -o "${ICONS_FOLDER}/icon.svg"

if command -v sips >/dev/null 2>&1; then
    echo "Converting icon.svg to ${ICON_NAME}..."
    sips -s format icns "${ICONS_FOLDER}/icon.svg" --out "${ICONS_FOLDER}/${ICON_NAME}" >/dev/null 2>&1
    rm "${ICONS_FOLDER}/icon.svg"
else
    echo "sips not available. Ensure you convert the icon manually to ${ICON_NAME}."
fi

echo "App bundle generation complete!"
