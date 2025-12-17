#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up niri config'
mkdir ~/.config/niri/
cp -r ./* ~/.config/niri/
rm ~/.config/niri/README.md
rm ~/.config/niri/install_niri.sh
echo 'Finished setting up niri config'
