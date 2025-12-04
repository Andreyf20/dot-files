#!/usr/bin/env bash

echo 'Setting up rofi config'
mkdir ~/.config/rofi/
cp -r ./* ~/.config/rofi/
rm ~/.config/rofi/install_rofi.sh
echo 'Finished setting up rofi config'
