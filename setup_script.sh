#!/usr/bin/env bash

# zshrc config
./zshrc_custom_commands.sh
echo '\n'

# tmux config
# Make sure to run prefix + I to install plugins
echo 'tmux config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./tmux/install_tmux.sh
  ./tmux/install_tmux.sh
fi
echo '\n'

# Nvim config
chmod +x ./nvim/install_nvim.sh
./nvim/install_nvim.sh
echo '\n'

# lazygit config
chmod +x ./lazygit/install_lazygit.sh
./lazygit/install_lazygit.sh
echo '\n'

# ghostty config
chmod +x ./ghostty/install_ghostty.sh
./ghostty/install_ghostty.sh
echo '\n'

# fastfetch config
chmod +x ./fastfetch/install_fastfetch.sh
./fastfetch/install_fastfetch.sh
echo '\n'

# MangoHud config
echo 'MangoHud config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./MangoHud/install_mangohud.sh
  ./MangoHud/install_mangohud.sh
fi
echo '\n'

# rofi config
echo 'rofi config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./rofi/install_rofi.sh
  ./rofi/install_rofi.sh
fi
echo '\n'

# Hyprland config
echo 'hyprland config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./hypr/install_hypr.sh
  ./hypr/install_hypr.sh
  chmod +x ./hyprpanel/install_hyprpanel.sh
  ./hyprpanel/install_hyprpanel.sh
fi
echo '\n'

# zed config
chmod +x ./zed/install_zed.sh
./zed/install_zed.sh

