#!/usr/bin/env bash

echo 'Setting up keyboard layout'
sudo mkdir /etc/keyd/
sudo cp ./keyd.conf /etc/keyd/default.conf
echo 'Finished setting up keyboard layout'
