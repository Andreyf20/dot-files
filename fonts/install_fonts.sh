#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

echo 'Setting up fonts'
mkdir ~/.local/share/fonts/
cp -r ./* ~/.local/share/fonts/
rm ~/.local/share/fonts/README.md
rm ~/.local/share/fonts/install_fonts.sh
fc-cache -f -v
echo -e '\n'
fc-list | grep andrey
echo 'Finished setting up fonts'
