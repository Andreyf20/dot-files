#!/usr/bin/env bash

# Git dir, change accordingly
echo 'Setting up zshrc config'
echo -e '\n' >> ~/.zshrc
echo '# My Custom Commands' >> ~/.zshrc
echo 'alias cdg="cd ~/Documents"' >> ~/.zshrc 
# Refresh git repo and pull, DEPRECATED: not using this anymore since i use Lazygit
echo 'alias grefresh="git fetch --prune origin && git pull --ff"' >> ~/.zshrc
# Command to copy nvim settings from local to the repo dir
echo 'alias cpnvimconfig="cp -r ~/.config/nvim ~/Documents/dot-files/ && cd ~/Documents/dot-files/"' >> ~/.zshrc
# Open neovim
echo 'alias n="nvim ./"' >> ~/.zshrc
echo 'alias nzsh="nvim ~/.zshrc"' >> ~/.zshrc
echo 'alias nconfig="nvim ~/.config/nvim"' >> ~/.zshrc
echo 'alias n.config="nvim ~/.config/"' >> ~/.zshrc
echo 'alias fzff="cd && fzf --preview=\"cat {}\" | xargs -r nvim"' >> ~/.zshrc # xargs prevents nvim from opening an empty file
echo 'alias fzfd="cd && find . -type d -print | fzf | xargs -r nvim"' >> ~/.zshrc
# Other extra commands
echo 'alias cat="bat"' >> ~/.zshrc # Remember to install bat
echo 'alias tmux="tmux -u"' >> ~/.zshrc
echo 'alias lg="lazygit"' >> ~/.zshrc
echo 'alias ls="eza -lir"' >> ~/.zshrc
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
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
echo 'Finished setting up zshrc config'

