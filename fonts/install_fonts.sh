#!/usr/bin/env bash

echo 'Setting up fonts'
mkdir ~/.local/share/fonts/
cp -r ./* ~/.local/share/fonts/
rm ~/.local/share/fonts/README.md
rm ~/.local/share/fonts/install_fonts.sh
fc-cache reload
fc-list | grep andrey
echo 'Finished setting up fonts'
