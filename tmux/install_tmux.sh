#!/usr/bin/env bash

echo 'Setting up tmux config'
mkdir ~/.tmux/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ./tmux.conf ~/.tmux/tmux.conf
echo 'Finished setting up tmux config'

