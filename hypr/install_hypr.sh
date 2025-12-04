#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up hypr config'
mkdir ~/.config/hypr/
cp -r ./* ~/.config/hypr/
rm ~/.config/hypr/README.md
rm ~/.config/hypr/install_hypr.sh
echo 'Finished setting up hypr config'
