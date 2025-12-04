#!/usr/bin/env bash

mkdir ~/.config

# zshrc config
./zshrc_custom_commands.sh
echo -e '\n'

# tmux config
# Make sure to run prefix + I to install plugins
echo 'tmux config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./tmux/install_tmux.sh
  ./tmux/install_tmux.sh
fi
echo -e '\n'

# Nvim config
chmod +x ./nvim/install_nvim.sh
./nvim/install_nvim.sh
echo -e '\n'

# lazygit config
chmod +x ./lazygit/install_lazygit.sh
./lazygit/install_lazygit.sh
echo -e '\n'

# ghostty config
chmod +x ./ghostty/install_ghostty.sh
./ghostty/install_ghostty.sh
echo -e '\n'

# fastfetch config
chmod +x ./fastfetch/install_fastfetch.sh
./fastfetch/install_fastfetch.sh
echo -e '\n'

# MangoHud config
echo 'MangoHud config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./MangoHud/install_mangohud.sh
  ./MangoHud/install_mangohud.sh
fi
echo -e '\n'

# rofi config
echo 'rofi config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./rofi/install_rofi.sh
  ./rofi/install_rofi.sh
fi
echo -e '\n'

# Hyprland config
echo 'hyprland config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./hypr/install_hypr.sh
  ./hypr/install_hypr.sh
  chmod +x ./hyprpanel/install_hyprpanel.sh
  ./hyprpanel/install_hyprpanel.sh
fi
echo -e '\n'

# zed config
chmod +x ./zed/install_zed.sh
./zed/install_zed.sh

