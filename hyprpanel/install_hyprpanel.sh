#!/usr/bin/env bash

echo 'Setting up hyprpanel config'
mkdir ~/.config/hyprpanel/
cp -r ./* ~/.config/hyprpanel/
rm ~/.config/hyprpanel/install_hyprpanel.sh
echo 'Finished setting up hyprpanel config'
