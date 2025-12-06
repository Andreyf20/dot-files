#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up starship config'
mkdir ~/.config/starship/
cp ./starship.toml ~/.config/starship/starship.toml
echo 'Finished setting up starship config'
