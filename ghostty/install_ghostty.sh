#!/usr/bin/env bash

# Set current dir to script dir
cd "$(dirname "$0")"

# Ghostty conf, the linux dir and the macos dir is different
echo 'Setting up ghostty config'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  mkdir ~/.config/ghostty/
  cp -r ./* ~/.config/ghostty/
  rm ~/.config/ghostty/README.md
  rm ~/.config/ghostty/install_ghostty.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  mkdir ~/Library/Application\ Support/com.mitchellh.ghostty/
  cp -r ./* ~/Library/Application\ Support/com.mitchellh.ghostty/
  rm ~/Library/Application\ Support/com.mitchellh.ghostty/README.md
  rm ~/Library/Application\ Support/com.mitchellh.ghostty/install_ghostty.sh
else
  # Unknown.
  echo 'Error: Unknown OS, cannot set ghostty config do it manually'
fi
echo 'Finished setting up ghostty config'
