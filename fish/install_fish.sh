#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up fish config'
mkdir ~/.config/fish/
cp -r ./* ~/.config/fish/
rm ~/.config/fish/install_fish.sh
echo 'Finished setting up fish config'

