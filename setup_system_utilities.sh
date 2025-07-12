#!/bin/bash

echo "🚀 [Vaani Hub Setup] Installing system utilities..."

# Install required apt packages
echo "📦 Installing system packages..."
sudo apt update
sudo apt install -y libpq-dev portaudio19-dev

# Create script directory if it doesn't exist
TARGET_DIR="/opt/vva/scripts"
sudo mkdir -p "$TARGET_DIR"

# Copy utility scripts
echo "📁 Copying system utility scripts to $TARGET_DIR"
sudo cp system-packages/*.sh "$TARGET_DIR"
sudo chmod +x "$TARGET_DIR"/*.sh

# Setup sudoers for vaani-hub user (optional)
SUDOERS_FILE="/etc/sudoers.d/vva-system-tools"
echo "🔐 Setting sudo permissions for vaani-hub..."
echo "vaani-hub ALL=(ALL) NOPASSWD: $TARGET_DIR/clean_cache.sh, $TARGET_DIR/clean_trash.sh" | sudo tee "$SUDOERS_FILE" > /dev/null

# Copy background images
BG_SRC="desktop_bg"
BG_DST="/usr/share/backgrounds/vva"

echo "🖼️ Copying background images..."
if [ -d "$BG_SRC" ]; then
    sudo mkdir -p "$BG_DST"
    sudo cp "$BG_SRC"/* "$BG_DST"
    echo "✅ Background images transferred to $BG_DST"
else
    echo "⚠️ No background images found to transfer."
fi

# Optional pip packages — only if --include-pip flag is passed
if [[ "$1" == "--include-pip" ]]; then
    echo "🐍 Installing dev-time pip packages..."
    pip install --no-cache-dir langchain-community PyAudio
else
    echo "⚠️ Skipping pip installs (use --include-pip to enable)..."
    echo "bash setup_system_utilities.sh --include-pip"
fi

echo "✅ Setup complete!"
