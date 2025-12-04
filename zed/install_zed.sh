#!/usr/bin/env bash

echo 'Setting up zed config'
mkdir ~/.config/zed/
cp -r ./* ~/.config/zed/
rm ~/.config/zed/install_zed.sh
echo 'Finished setting up zed config'
