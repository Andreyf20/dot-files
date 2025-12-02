### Classic terrible program not using .config but it is what it is

MacOS: `$ cp -r ./* ~/Library/Application Support/com.mitchellh.ghostty/`

Linux: `$ cp -r ./* ~/.config/ghostty/`

When updating the config file remember to wq from nvim because reloading doesn't work if the file is open.
