#!/bin/bash

# CAM-HUNTER Installer & Updater by ADIRTTA

INSTALL_DIR="$HOME/.camhunter"
REPO_URL="https://github.com/ADIRTTA/CAM-HUNTER.git"
COMMAND_NAME="CAM-HUNTER"
SHORTCUT_PATH="$PREFIX/bin/$COMMAND_NAME"

# ANSI color codes
GREEN="\033[1;32m"
RESET="\033[0m"

clear
echo "📹 Installing or Updating CAM-HUNTER Tool..."
sleep 1

# Install required packages
pkg update -y && pkg install -y git python wget -y
pip install requests rich pyfiglet colorama

# Clone or update the tool
if [ -d "$INSTALL_DIR" ]; then
    echo "🔁 Updating existing CAM-HUNTER..."
    cd "$INSTALL_DIR" && git pull
else
    echo "⬇️ Cloning CAM-HUNTER repository..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

# Create or update shortcut command
echo -e "#!/bin/bash\npython3 $INSTALL_DIR/cam-hunter.py" > "$SHORTCUT_PATH"
chmod +x "$SHORTCUT_PATH"

# Finish
echo -e "\n✅ CAM-HUNTER is ready to use!"
echo -e "🚀 Now you can run the tool anytime by typing: ${GREEN}$COMMAND_NAME${RESET}"
