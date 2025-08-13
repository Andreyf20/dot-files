#!/bin/bash

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
echo 'alias ff="clear && fastfetch"' >> ~/.zshrc
# Setup fzf to work with zsh command history ctrl+r
echo -e '\n' >> ~/.zshrc
echo 'source <(fzf --zsh)' >> ~/.zshrc
echo 'HISTFILE=~/.zsh_history' >> ~/.zshrc
echo 'HISTSIZE=10000' >> ~/.zshrc
echo 'SAVEHIST=10000' >> ~/.zshrc
echo 'setopt appendhistory' >> ~/.zshrc
echo '# My Custom Commands end' >> ~/.zshrc
echo -e '\n' >> ~/.zshrc
# Setup go path
echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin' >> ~/.zshrc
# Setup dotnet path
echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.zshrc
echo 'Finished setting up zshrc config'

# Tmux conf
echo 'Setting up tmux config'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
cp ./tmux.conf ~/.tmux.conf
echo 'Finished setting up tmux config'
# Make sure to run prefix + I to install plugins

# Nvim conf
echo 'Setting up nvim config'
mkdir ~/.config/
cp -r ./nvim ~/.config/nvim/ &&
rm ~/.config/nvim/README.md
echo 'Finished setting up nvim config'

# Lazygit conf, the linux dir and the macos dir is different
echo 'Setting up lazygit config'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  mkdir ~/.config/lazygit/ &&
  cp ./lazygit/config.yml ~/.config/lazygit/config.yml
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  mkdir ~/Library/Application\ Support/lazygit/ &&
  cp ./lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
else
  # Unknown.
  echo 'Error: Unknown OS, cannot set lazygit config do it manually'
fi
echo 'Finished setting up lazygit config'

# Fastfetch conf
echo 'Setting up Fastfetch config'
mkdir ~/.config/fastfetch/
cp ./Fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
echo 'Finished setting up Fastfetch config'

# Optional confs
if [[ $1 == "optionalconfs" ]]; then
  echo -e '\nOptional Confs'
	# MangoHud conf
	echo 'Setting up MangoHud config'
	cp -r ./MangoHud ~/.config/MangoHud/ &&
	rm ~/.config/MangoHud/README.md
	echo 'Finished setting up MangoHud config'
else
  echo 'No optional confs'
fi

