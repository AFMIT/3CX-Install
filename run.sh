#!/bin/bash

echo "STARTING DEBIAN UPDATES"
apt update && apt upgrade -y
echo "DOWNLOADING SWAP FILES"
apt install sudo wget gnupg2 dphys-swapfile -y
echo "DOWLOADING PUBLIC KEY"
wget -O- https://repo.3cx.com/key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/3cx-archive-keyring.gpg > /dev/nullecho "DOWNLOADING REPOSITORIES"
echo "deb [arch=amd64 by-hash=yes signed-by=/usr/share/keyrings/3cx-archive-keyring.gpg] http://repo.3cx.com/3cx bookworm main" | tee /etc/apt/sources.list.d/3cxpbx.list
echo "Updating all files"
apt update
echo "DOWNLOADING 3CX"
apt install 3cxpbx -y
