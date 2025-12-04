#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up nvim config'
mkdir ~/.config/nvim/
cp -r ./* ~/.config/nvim/ &&
rm ~/.config/nvim/README.md
rm ~/.config/nvim/install_nvim.sh
echo 'Finished setting up nvim config'
