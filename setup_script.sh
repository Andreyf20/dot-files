#!/usr/bin/env bash

# zshrc config
./zshrc/install_zshrc.sh

# tmux config
# Make sure to run prefix + I to install plugins
echo 'tmux config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  ./tmux/install_tmux.sh
fi

# Nvim config
./nvim/install_nvim.sh

# lazygit config
./lazygit/install_lazygit.sh

# ghostty config
./ghostty/install_ghostty.sh

# fastfetch config
./fastfetch/install_fastfetch.sh

# MangoHud config
echo 'MangoHud config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  ./MangoHud/install_mangohud.sh
fi

# rofi config
echo 'rofi config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  ./rofi/install_rofi.sh
fi
