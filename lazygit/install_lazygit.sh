#!/usr/bin/env bash

# Lazygit conf, the linux dir and the macos dir is different
echo 'Setting up lazygit config'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  mkdir ~/.config/lazygit/
  cp ./config.yml ~/.config/lazygit/config.yml
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  mkdir ~/Library/Application\ Support/lazygit/
  cp ./config.yml ~/Library/Application\ Support/lazygit/config.yml
else
  # Unknown.
  echo 'Error: Unknown OS, cannot set lazygit config do it manually'
fi
echo 'Finished setting up lazygit config'
