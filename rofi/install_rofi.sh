#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up rofi config'
mkdir ~/.config/rofi/
cp -r ./* ~/.config/rofi/
rm ~/.config/rofi/install_rofi.sh
echo 'Finished setting up rofi config'
