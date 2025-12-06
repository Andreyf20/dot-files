# source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
function fish_greeting
    fastfetch
end

# Source universal variables if file exists
if test -f ~/.config/fish/universal.fish
    source ~/.config/fish/universal.fish
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

if test -d /opt/homebrew/bin
    if not contains -- /opt/homebrew/bin $PATH
        set -p PATH /opt/homebrew/bin
    end
end

if test -d /opt/homebrew/opt/rustup/bin
    if not contains -- /opt/homebrew/opt/rustup/bin $PATH
        set -p PATH /opt/homebrew/opt/rustup/bin
    end
end

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
# Functions stolen from default CachyOS config, /usr/share/cachyos-fish-config/
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end
# End of functions needed for !! and !$

# My abbreviations
abbr --add n nvim .
abbr --add nfish nvim ~/.config/fish/
abbr --add nconfig nvim ~/.config/nvim/
abbr --add n.config nvim ~/.config/
abbr --add lg lazygit
abbr --add tx tmux -u

# My aliases
alias ls="eza -l --sort type"
alias cd="z"
alias cat="bat"
alias ff="clear && fastfetch"
alias change_wallpaper="python ~/.config/hypr/scripts/change_wallpaper.py"

# Inits
zoxide init fish | source
starship init fish | source
