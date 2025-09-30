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

### /etc/nixos/configuration.nix

Add the import

```
  imports = [
    ./hardware-configuration.nix
    /home/<USERNAME>/.config/nixos/polaris.nix
  ];
```

### ~/dots/.config/nixos/users.nix

**Change everywhere it says gale to instead say your user's name**

---

Finally run

```sh
sudo nixos-rebuild switch
```
