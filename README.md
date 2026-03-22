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
- `home/javier/common.nix`: shared Home Manager config for the user
- `home/javier/poremski.nix`: host-specific Home Manager config
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
