#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up MangoHud config'
mkdir ~/.config/MangoHud/
cp ./MangoHud.conf ~/.config/MangoHud/MangoHud.conf
echo 'Finished setting up MangoHud config'
