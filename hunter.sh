
#!/bin/bash

# CAM-HUNTER Installer by ADIRTTA

clear
echo "📹 Installing CAM-HUNTER Tool..."
sleep 1

# Update and install dependencies
pkg update -y && pkg install -y git python wget
pip install requests rich pyfiglet colorama

# Clone the CAM-HUNTER repository
git clone https://github.com/ADIRTTA/CAM-HUNTER.git $HOME/.camhunter

# Create a launcher command
echo -e '#!/bin/bash\npython3 $HOME/.camhunter/cam-hunter.py' > $PREFIX/bin/CAM-HUNTER
chmod +x $PREFIX/bin/CAM-HUNTER

# Done!
echo -e "\n✅ CAM-HUNTER installed successfully!"
echo "🚀 Type 'CAM-HUNTER' to launch the tool!"
