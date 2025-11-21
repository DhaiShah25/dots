# Dotfiles

These are my dotfiles for a hyprland setup on nixOS. I have based some of the nixOS configuration from the following [gist](https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5#file-nixos-rebuild-sh-L10)

The desktop consists of the following:

- waybar
- hyprland
- rofi-wayland
- hyprpaper
- hyprlock
- nixos
- etc.

## Install

To Install From Just A NixOS Minimal Install Run

```sh
nix-shell -p stow git
git clone https://github.com/DhaiShah25/dots ~/dots
cd ~/dots
stow .
```

And Then Using Any Text Editor Change the following

### Hardware Configuration

> [!IMPORTANT]
> Do this, otherwise this will break your rebuild

copy your hardware-configuration.nix to replace the one in this directory

```sh
cp /etc/nixos/hardware-configuration.nix ~/dots/.config/nixos/hardware-configuration.nix && cd ~/dots && stow .
```

### ~/dots/.config/nixos/users.nix

> [!IMPORTANT]
> Do this, otherwise you will not be able to log into the new nixOS generation

**Change everywhere it says gale to instead say your user's name**

---

Finally run

> [!IMPORTANT]
> This command includes rebooting so you switch over to the new system, login, kernel, etc
> so please make sure to save your progress before running it or just omit the
> `&& systemctl reboot` but rebooting is recommended to test if the system works and
> so you have the right kernel, etc.

```sh
cd ~/.config/nixos/ && sudo nixos-rebuild switch --flake . && systemctl reboot
```
