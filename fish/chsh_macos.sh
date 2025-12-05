#!/usr/bin/env bash

sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
# Can verifu with which fish and see the location of the binary
chsh -s /opt/homebrew/bin/fish
