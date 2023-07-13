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
# Setup go path
echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
echo 'export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin' >> ~/.zshrc
# Setup dotnet path
echo 'export PATH="$PATH:$HOME/.dotnet/tools"' >> ~/.zshrc

# Tmux conf
echo 'set -g default-terminal "screen-256color"' >> ~/.tmux.conf
echo 'set -as terminal-features ",xterm-256color:RGB"' >> ~/.tmux.conf
echo 'set -g base-index 1' >> ~/.tmux.conf
echo 'setw -g pane-base-index 1' >> ~/.tmux.conf
echo 'set-option -sg escape-time 10' >> ~/.tmux.conf

# Copy nvim config to HOME
mkdir ~/.config/ &&
cp -r ./nvim ~/.config/nvim/ &&
rm ~/.config/nvim/README.md
