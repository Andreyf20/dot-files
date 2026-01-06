# QWERTY Custom Symbols

This is my custom keyboard layout. It is based on [ThePrimeagen's DVORAK version.](https://github.com/ThePrimeagen/keyboards)

It is recommended to log out/restart after adding the keyboard layout.

## Keyboard Layout Preview

Base layer Inverted:
![Base layer Inverted](./Base.png)

Shift layer Inverted:
![Shift layer Inverted](./Shift.png)

### MacOS

Made using [Ukelele](https://software.sil.org/ukelele/).

```
sudo cp ./QWERTY_custom_symbols_inverted.keylayout /Library/Keyboard\ Layouts
```

### Windows

Made using [MSKLC](https://www.microsoft.com/en-us/download/details.aspx?id=102134)

Go to -> Project -> Build -> Install layout

### Linux

This uses [Keyd](https://github.com/rvaiya/keyd) a linux tool to overwrite keys. 
Put the keyd.conf in `/etc/keyd/default.conf`

Commands:
```
sudo systemctl enable keyd --now
sudo systemctl disable keyd --now
sudo keyd reload
```
