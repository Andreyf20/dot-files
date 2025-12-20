> [!WARNING]
> NOT FINISHED! Still a wip.

# Niri

https://github.com/YaLTeR/niri

Check the [installation commands](https://yalter.github.io/niri/Getting-Started.html)

## Programs needed for the setup

- [awww](https://codeberg.org/LGFae/awww): `$ yay awww`
- [grim and slurp](https://gitlab.freedesktop.org/emersion/grim): 
- [satty](https://github.com/Satty-org/Satty): `$ yay satty`
- [Rofi](https://github.com/davatorium/rofi): `$ yay rofi`
- [noctalia-shell](https://github.com/noctalia-dev/noctalia-shell): `$ yay -S noctalia-shell` 
- [hyprpicker](https://github.com/hyprwm/hyprpicker): `$ yay hyprpicker`
- [polkit-gnome or plasma-polkit-agent](): `$ yay polkit-gnome`

## Disclaimer

When using noctalia-shell, the notifications were not working. To make them work:
- Added the [debug {}](https://docs.noctalia.dev/getting-started/compositor-settings/) option to niri in window_rules.kdl
- Switched to noctalia-shell-git
- But probably what made it work, uninstalling [mako](https://github.com/noctalia-dev/noctalia-shell/issues/689#issuecomment-3508855654)

