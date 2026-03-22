# Nix configuration

This repository currently manages Home Manager on Arch Linux and is structured
to make a later move to NixOS easier.

Current naming:

- user: `javier`
- host: `poremski`
- fqdn: `poremski.home.arpa`

Main Home Manager target:

```bash
home-manager switch --flake ~/.dotfiles#javier-poremski
```

Current structure:

- `lib/hosts.nix`: host metadata used to generate flake outputs
- `profiles/base.nix`: common profile for most machines
- `profiles/desktop.nix`: desktop-oriented profile layered on top of `base`
- `home/javier/common.nix`: shared Home Manager config for the user
- `home/javier/poremski.nix`: host-specific Home Manager config
- `modules/cli`: CLI tools and terminal programs shared across hosts
- `modules/shell`: shell configuration shared across hosts
- `modules/editors`: editor configuration shared across hosts
- `modules/nixos/base.nix`: shared NixOS base that wires user, profiles and Home Manager together
- `hosts/poremski/default.nix`: future NixOS host config for `poremski`

Available flake targets:

```bash
home-manager switch --flake ~/.dotfiles#javier-poremski
nixos-rebuild switch --flake ~/.dotfiles#poremski
```

To add another host later:

1. Add a new entry in `lib/hosts.nix`
2. Create `home/<user>/<host>.nix`
3. Create `hosts/<host>/default.nix` when that machine moves to NixOS

Profiles let multiple hosts share the same role without duplicating imports.
The shared NixOS base does the same for system-level Home Manager wiring.
