# Git dir, change accordingly
echo 'alias cdg="cd ~/Documents"' >> ~/.zshrc 
# Refresh git repo and pull
echo 'alias grefresh="git fetch --prune origin && git pull --ff"' >> ~/.zshrc
# Copy nvim settings from local to the repo dir
echo 'alias cpnvimconfig="cp -r ~/.config/nvim ~/Documents/dot-files/ && cd ~/Documents/dot-files/"' >> ~/.zshrc
# Open neovim
echo 'alias n="nvim ./"' >> ~/.zshrc
echo 'alias nzsh="nvim ~/.zshrc"' >> ~/.zshrc
echo 'alias nconfig="nvim ~/.config/nvim"' >> ~/.zshrc
echo 'alias tmux="tmux -u"' >> ~/.zshrc
echo 'alias lg="lazygit"' >> ~/.zshrc
echo 'alias n.config="nvim ~/.config/"' >> ~/.zshrc
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

# Lazygit conf
mkdir ~/.config/lazygit/ &&
cp ./lazygit/config.yml ~/.config/lazygit/config.yml
