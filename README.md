# Nix configuration

This repository manages NixOS and Home Manager through a single flake.

Current naming:

- user: `javier`
- host: `poremski`
- fqdn: `poremski.home.arpa`

Main host target:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles#poremski
```

Helper commands:

```bash
~/.dotfiles/bin/rebuild
~/.dotfiles/bin/update
```

`bin/rebuild` runs `nix flake check` and rebuilds the host that matches the current hostname.
`bin/update` updates flake inputs and then runs `bin/rebuild`.

Current structure:

- `lib/hosts.nix`: host metadata used to generate flake outputs
- `profiles/base.nix`: common profile for most machines
- `profiles/desktop.nix`: desktop-oriented profile layered on top of `base`
- `home/javier/common.nix`: shared Home Manager config for the user
- `home/javier/poremski.nix`: host-specific Home Manager config
- `modules/apps`: desktop applications shared across hosts, such as Firefox
- `modules/cli`: CLI tools and terminal programs shared across hosts
- `modules/security`: shared security-related tooling such as GPG agent integration
- `modules/shell`: shell configuration shared across hosts
- `modules/editors`: editor configuration shared across hosts
- `bin/rebuild`: host-aware rebuild helper that runs `nix flake check` before switching
- `bin/update`: flake update helper that rebuilds after updating inputs
- `modules/nixos/base.nix`: shared NixOS base that wires user, profiles and Home Manager together
- `modules/nixos/system.nix`: NixOS-wide defaults such as Nix settings and core packages
- `modules/nixos/locale.nix`: timezone, locale and console keymap
- `modules/nixos/networking.nix`: baseline networking and SSH settings
- `modules/nixos/audio.nix`: PipeWire and related audio services
- `modules/nixos/laptop.nix`: laptop-oriented services such as power, fwupd, bluetooth and thunderbolt
- `modules/nixos/printing.nix`: CUPS, mDNS discovery and printer drivers
- `modules/nixos/desktop/plasma.nix`: Plasma desktop, SDDM and keyboard layout
- `hosts/poremski/default.nix`: NixOS host config for `poremski`
- `hosts/poremski/hardware-configuration.nix`: host-specific boot, disk and filesystem layout

Available flake targets:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles#poremski
home-manager switch --flake ~/.dotfiles#javier-poremski
```

Editor integration:

- Zed is configured declaratively through Home Manager
- Codex is exposed to Zed through `codex-acp`
- the flake includes `llm-agents` as an input for that workflow

To add another host later:

1. Add a new entry in `lib/hosts.nix`
2. Create `home/<user>/<host>.nix`
3. Create `hosts/<host>/default.nix` for that machine's NixOS configuration

Profiles let multiple hosts share the same role without duplicating imports.
The shared NixOS base does the same for system-level Home Manager wiring.
