#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

# Git dir, change accordingly
echo 'Setting up zshrc config'
echo -e '\n' >> ~/.zshrc
echo '# My Custom Commands' >> ~/.zshrc
# Open neovim
echo 'alias n="nvim ."' >> ~/.zshrc
echo 'alias nzsh="nvim ~/.zshrc"' >> ~/.zshrc
echo 'alias nconfig="nvim ~/.config/nvim"' >> ~/.zshrc
echo 'alias n.config="nvim ~/.config/"' >> ~/.zshrc
# Other extra commands
echo 'alias cat="bat"' >> ~/.zshrc # Remember to install bat
echo 'alias tx="tmux -u"' >> ~/.zshrc
echo 'alias lg="lazygit"' >> ~/.zshrc
echo 'alias ls="eza -l --sort type"' >> ~/.zshrc
echo 'alias cd="z"' >> ~/.zshrc
echo 'alias ff="clear && fastfetch"' >> ~/.zshrc
echo 'alias change_wallpaper="python ~/.config/hypr/scripts/change_wallpaper.py"' >> ~/.zshrc
echo '# My Custom Commands end' >> ~/.zshrc
# Setup fzf to work with zsh command history ctrl+r
echo -e '\n' >> ~/.zshrc
echo '# Press ctrl+r to search in history' >> ~/.zshrc
echo 'source <(fzf --zsh)' >> ~/.zshrc
echo 'HISTFILE=~/.zsh_history' >> ~/.zshrc
echo 'HISTSIZE=10000' >> ~/.zshrc
echo 'SAVEHIST=10000' >> ~/.zshrc
echo 'setopt appendhistory' >> ~/.zshrc
echo -e '\n' >> ~/.zshrc
# Setup go path
echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin' >> ~/.zshrc
# Setup dotnet path
echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.zshrc
echo 'export EDITOR=nvim' >> ~/.zshrc
# Setup zoxide in zsh
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
echo 'Finished setting up zshrc config'

