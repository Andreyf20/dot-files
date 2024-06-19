# Git dir, change accordingly
echo '\n' >> ~/.zshrc
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
echo 'alias fzfn="fzf --preview=\"cat {}\" | xargs -r nvim"' >> ~/.zshrc # xargs prevents nvim from opening an empty file
# Other extra commands
echo 'alias cat="bat"' >> ~/.zshrc # Remember to install bat
echo 'alias tmux="tmux -u"' >> ~/.zshrc
echo 'alias lg="lazygit"' >> ~/.zshrc
# Setup fzf to work with zsh command history ctrl+r
echo 'source <(fzf --zsh)' >> ~/.zshrc
echo 'HISTFILE=~/.zsh_history' >> ~/.zshrc
echo 'HISTSIZE=10000' >> ~/.zshrc
echo 'SAVEHIST=10000' >> ~/.zshrc
echo 'setopt appendhistory' >> ~/.zshrc
echo '# My Custom Commands end' >> ~/.zshrc
echo '\n' >> ~/.zshrc
# Setup go path
echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin' >> ~/.zshrc
# Setup dotnet path
echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.zshrc

# Tmux conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &&
cp ./tmux.conf ~/.tmux.conf
# Make sure to run prefix + I to install plugins

# Nvim conf
mkdir ~/.config/ &&
cp -r ./nvim ~/.config/nvim/ &&
rm ~/.config/nvim/README.md

# Lazygit conf, this is the linux dir the macos dir is different (~/Library/Application Support/lazygit)
mkdir ~/.config/lazygit/ &&
cp ./lazygit/config.yml ~/.config/lazygit/config.yml
