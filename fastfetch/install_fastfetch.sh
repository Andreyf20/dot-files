#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up fastfetch config'
mkdir ~/.config/fastfetch/
cp -r ./* ~/.config/fastfetch/
rm ~/.config/fastfetch/README.md
rm ~/.config/fastfetch/fastfetch_ricing.png
rm ~/.config/fastfetch/install_fastfetch.sh
echo 'Finished setting up fastfetch config'
