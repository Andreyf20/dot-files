### General
[Kanata](https://github.com/jtroo/kanata/releases) used to remap some keys to make them more useful.

Currently using it for:
-Homerow mods (meta, alt, shift, ctrl)
-CapsLock to Esc (This could be done with a remap in the keyborad layout but I can't reinstall it on my work laptop right now)

The config file kanata.kbd needs to be placed in the same folder as kanata.

## Windows
For some reason the simplest solution out of the three OSes. It just works.

You can use the kanata_gui.exe to get a tray icon running the program.

Also you can create a shortcut to the executable and add it to your startup folder.

## MacOS
Extremely painful to setup:

Part of the tutorial [here](https://github.com/jtroo/kanata/discussions/1537) and [here](https://github.com/jtroo/kanata/issues/1264#issuecomment-2763085239).

1. Install the full karabiner-elements `$ brew install --cask karabiner-elements` (kanata uses the virtualhid driver).
1. Open karabiner-eventviewer and give permisison, open karabiner-elements, give permisison and follow the tutorial.
1. Make sure to completely close out of karabiner-elements app and exit the system tray icon too.
1. Next steps were not tested but don't hurt i guess:
1. MacOS settings -> Privacy and Security -> Input Monitoring -> Add Terminal and Kanata (shift+cmd+g -> /opt/homebrew/bin/kanata).
1. MacOS settings -> Privacy and Security -> Accessibility -> Add Terminal and Kanata (shift+cmd+g -> /opt/homebrew/bin/kanata).

Make sure it is working by running `$ kanata -c /Users/andreymac/Documents/GIT_ROOT/dot-files/kanata/kanata.kbd` in the terminal.

1. Copy the config file `$ mkdir ~/.config/kanata/ && cp kanata.kbd ~/.config/kanata/`, needed MacOS doesn't check this dir for permissions
1. Copy the service file `$ sudo cp com.kanata.plist /Library/LaunchDaemons/`
1. Load the service `$ sudo launchctl load /Library/LaunchDaemons/com.kanata.plist`
1. Start the service `$ sudo launchctl start com.kanata.plist`

Check if it is working by typing or check `$ sudo launchctl list | grep kanata` and see if it has a pid.

## Linux
NOT TESTED YET!!!

Use the Dreamsofcode tutorial to setup the [service](https://github.com/dreamsofcode-io/home-row-mods/tree/main/kanata/linux).

Also needs to use the kanata.kbd.linux file instead, tap-hold has some weird behavior on linux so it needs a workaround.
