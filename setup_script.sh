#!/usr/bin/env bash

# zshrc config
./zshrc_custom_commands.sh

# tmux config
# Make sure to run prefix + I to install plugins
echo 'tmux config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./tmux/install_tmux.sh
  ./tmux/install_tmux.sh
fi

# Nvim config
chmod +x ./tmux/install_tmux.sh
./nvim/install_nvim.sh

# lazygit config
chmod +x ./lazygit/install_lazygit.sh
./lazygit/install_lazygit.sh

# ghostty config
chmod +x ./ghostty/install_ghostty.sh
./ghostty/install_ghostty.sh

# fastfetch config
chmod +x ./fastfetch/install_fastfetch.sh
./fastfetch/install_fastfetch.sh

# MangoHud config
echo 'MangoHud config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./MangoHud/install_mangohud.sh
  ./MangoHud/install_mangohud.sh
fi

# rofi config
echo 'rofi config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./rofi/install_rofi.sh
  ./rofi/install_rofi.sh
fi
