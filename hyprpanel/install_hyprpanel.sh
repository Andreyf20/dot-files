#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up hyprpanel config'
mkdir ~/.config/hyprpanel/
cp -r ./* ~/.config/hyprpanel/
rm ~/.config/hyprpanel/install_hyprpanel.sh
echo 'Finished setting up hyprpanel config'
