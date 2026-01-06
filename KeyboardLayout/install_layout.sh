#!/usr/bin/env bash

echo 'Setting up keyboard layout'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    sudo mkdir /etc/keyd/
    sudo cp ./keyd.conf /etc/keyd/default.conf
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    sudo cp ./QWERTY_custom_symbols_inverted.keylayout /Library/Keyboard\ Layouts
else
    # Unknown.
    echo 'Error: Unknown OS'
fi
echo 'Finished setting up keyboard layout'
