#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up doom emacs config'
mkdir ~/.config/doom/
cp -r ./* ~/.config/doom/
rm ~/.config/fish/install_doom_emacs.sh
echo 'Finished setting up doom emacs config'
