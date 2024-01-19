#!/bin/bash

# Define the directories for cloning and final location for NetExec
SILENTHOUND_DIR="$HOME/SilentHound"

# Install Python3 and pip
sudo apt-get update
echo "Installing Python3 and pip..."
sudo apt-get install -y python3 python3-pip
echo "Installing CrackMapExec..."
sudo apt install crackmapexec -y
echo "Installing Impacket..."
sudo apt install python3-impacket -y
pip3 install ldap3
pip3 install colorama
pip3 install alive-progress
apt install pipx git
pipx ensurepath
pipx install git+https://github.com/Pennyw0rth/NetExec

# Clone SilentHound repository
echo "Cloning SilentHound..."
git clone https://github.com/layer8secure/SilentHound.git "$SILENTHOUND_DIR"

# Move silenthound.py to /usr/bin and make it executable
echo "Setting up SilentHound..."
sudo mv "$SILENTHOUND_DIR/silenthound.py" /usr/bin/silenthound
sudo chmod +x /usr/bin/silenthound
rm -rf "$SILENTHOUND_DIR" # Remove SilentHound directory



# Move NetExec to a final directory and setup Python virtual environment
echo "Setting up NetExec..."
sudo mv "$NETEXEC_DIR" "$NETEXEC_FINAL_DIR"
cd "$NETEXEC_FINAL_DIR"
python3 -m venv .
source bin/activate
pip install .
clear

echo "Setup complete! SilentHound and NetExec are ready to use."

