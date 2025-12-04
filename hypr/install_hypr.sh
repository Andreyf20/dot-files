#!/usr/bin/env bash

echo 'Setting up hypr config'
mkdir ~/.config/hypr/
cp -r ./* ~/.config/hypr/
rm ~/.config/hypr/README.md
rm ~/.config/hypr/install_hypr.sh
echo 'Finished setting up hypr config'
