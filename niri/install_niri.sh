#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up niri config'
mkdir ~/.config/niri/
cp ./config.kdl ~/.config/niri/config.kdl
echo 'Finished setting up niri config'
