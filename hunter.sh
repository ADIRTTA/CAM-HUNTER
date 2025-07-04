#!/bin/bash

# Install/update directory
INSTALL_DIR="$HOME/CAM-HUNTER"

# GitHub repo URL
REPO="https://github.com/ADIRTTA/CAM-HUNTER.git"

# Check if folder exists
if [ -d "$INSTALL_DIR" ]; then
    echo "[*] CAM-HUNTER found, updating..."
    cd "$INSTALL_DIR"
    git pull origin main
else
    echo "[*] Installing CAM-HUNTER..."
    git clone "$REPO" "$INSTALL_DIR"
fi

# Create a shortcut command if not exists
BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"

COMMAND_FILE="$BIN_DIR/CAM-HUNTER"

if [ ! -f "$COMMAND_FILE" ]; then
    echo "[*] Creating shortcut command 'CAM-HUNTER'..."
    echo "#!/bin/bash
python3 $INSTALL_DIR/cam-hunter.py" > "$COMMAND_FILE"
    chmod +x "$COMMAND_FILE"
fi

echo "[*] Installation/Update complete."
echo "You can now run the tool by typing: CAM-HUNTER"
