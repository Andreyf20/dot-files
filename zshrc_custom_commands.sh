# Git dit change accordingly
echo alias cdg="~/Documents" >> ~/.zshrc 
# Refresh git dir and pull
echo alias grefresh="git fetch --prune origin && git pull --ff" >> ~/.zshrc
# copy nvim settings from git local master to the config/
echo alias cpnvimconfig="cp -r ~/.config/nvim ~/Documents/dot-files/ && cd ~/Documents/dot-files/" >> ~/.zshrc

# Add to ~/.tmux.conf in case we do not see colors
echo set -g default-terminal "screen-256color" >> ~/.tmux.conf
