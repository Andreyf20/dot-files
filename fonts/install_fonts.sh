#!/usr/bin/env bash

cp -r ./* ~/.local/share/fonts/ &&
rm ~/.local/share/fonts/README.md &&
fc-cache reload &&
fc-list | grep andrey
