#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up satty config'
mkdir ~/.config/satty/
cp ./satty/config.toml ~/.config/satty/
echo 'Finished setting up satty config'
