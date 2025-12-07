> [!WARNING]
> NOT FINISHED! Still a wip.

# Hyprland

## Programs needed for the setup

- [hyprpanel](https://github.com/Jas-SinghFSU/HyprPanel): `$ yay -S ags-hyprpanel-git`
- [awww](https://codeberg.org/LGFae/awww): `$ yay awww`
- [grimblast](https://github.com/hyprwm/contrib): `$ yay -S grimblast-git`
- [satty](https://github.com/Satty-org/Satty): `$ yay satty`
- [xdg-hyprland-portal](https://github.com/hyprwm/xdg-desktop-portal-hyprland): `$ yay xdg-desktop-portal-hyprland`
- [lxappearance](https://github.com/lxde/lxappearance): `$ yay lxappearance` or `$ yay nwg-look`
- [Theming qt applications](): `$ sudo pacman -S gt6ct kvantum qt6-wayland qt5-wayland`
- [hyprpolkitagent](https://github.com/hyprwm/hyprpolkitagent): `$ yay hyprpolkitagent` - Might need the gnomepolkit or kdepolkit for some apps

## Disclaimer

Some prgrams that need permissions do not open the window to type the password. You need to run them from the terminal or install a polkit and try again.
Example: `$ input-remapper-gtk`

## Setup hyprpm

[Hyprland Plugins Github Repo](https://github.com/hyprwm/hyprland-plugins).

This setup is using the scrolling plugin. `$ hyprpm update; hyprpm add https://github.com/hyprwm/hyprland-plugins; hyprpm enable hyprscrolling`
This might fail because of missing dependencies, just install them and try again.
