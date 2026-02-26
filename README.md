# Dotfiles Bootstrap

Arch Linux bootstrap for my current customized Hyprland setup.
This repo contains personal modifications on top of [`end-4/dots-hyprland`](https://github.com/end-4/dots-hyprland).

## Run

Bootstrap (default behavior):

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/ZebaLive/illogical-impulse-dotfiles/main/setup)
```

Local install subcommand (from a local checkout):

```bash
cd ~
git clone https://github.com/ZebaLive/illogical-impulse-dotfiles
cd ~/illogical-impulse-dotfiles
./setup install
```

## Notes

- Script targets Arch Linux (`pacman` required).
- You may be prompted for `sudo` depending on how you run it.

## Credits

- Base Hyprland setup: [`end-4/dots-hyprland`](https://github.com/end-4/dots-hyprland).
