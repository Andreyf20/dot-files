#!/usr/bin/env bash

mkdir ~/.config &> /dev/null

# Nvim config
chmod +x ./nvim/install_nvim.sh
./nvim/install_nvim.sh
echo -e '\n'

# tmux config
# Make sure to run prefix + I to install plugins
chmod +x ./tmux/install_tmux.sh
./tmux/install_tmux.sh
echo -e '\n'

# lazygit config
chmod +x ./lazygit/install_lazygit.sh
./lazygit/install_lazygit.sh
echo -e '\n'

# zed config
chmod +x ./zed/install_zed.sh
./zed/install_zed.sh
echo -e '\n'

# ghostty config
chmod +x ./ghostty/install_ghostty.sh
./ghostty/install_ghostty.sh
echo -e '\n'

# fastfetch config
chmod +x ./fastfetch/install_fastfetch.sh
./fastfetch/install_fastfetch.sh
echo -e '\n'

# zshrc config
echo 'zsh config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./zshrc_custom_commands.sh
  ./zshrc_custom_commands.sh
  echo -e '\n'
fi

# fish config
echo 'fish config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./fish/install_fish.sh
  ./fish/install_fish.sh
  chmod ~x ./starship/install_starship.sh
  ./starship/install_starship.sh
  echo -e '\n'
fi

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
  chmod +x ./satty/install_satty.sh
  ./satty/install_satty.sh
fi
echo -e '\n'

# Niri config
echo 'niri config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./niri/install_niri.sh
  ./niri/install_niri.sh
  chmod +x ./satty/install_satty.sh
  ./satty/install_satty.sh
fi
echo -e '\n'

# Personal scripts config
echo 'personal scripts config? y/N'
read confirm
if [[ $confirm == "y" ]]; then
  chmod +x ./personal_scripts/install_ps.sh
  ./personal_scripts/install_ps.sh
fi
echo -e '\n'
