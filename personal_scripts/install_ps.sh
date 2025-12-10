#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up personal scripts'
mkdir ~/.config/personal_scripts/
cp -r ./* ~/.config/personal_scripts/
rm ~/.config/personal_scripts/install_ps.sh
echo 'Finished setting up personal scripts'
