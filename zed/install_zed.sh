#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up zed config'
mkdir ~/.config/zed/
cp -r ./* ~/.config/zed/
rm ~/.config/zed/install_zed.sh
echo 'Finished setting up zed config'
