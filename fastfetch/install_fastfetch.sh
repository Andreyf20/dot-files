#!/usr/bin/env bash

echo 'Setting up MangoHud config'
mkdir ~/.config/fastfetch/
cp -r ./* ~/.config/fastfetch/
rm ~/.config/fastfetch/README.md
rm ~/.config/fastfetch/fastfetch_ricing.png
rm ~/.config/fastfetch/install_fastfetch.sh
echo 'Finished setting up MangoHud config'
