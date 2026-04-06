# Nix configuration

[![CI](https://github.com/Poremski/nix-config/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/Poremski/nix-config/actions/workflows/ci.yml)

This repository manages NixOS and Home Manager through a single flake.

Current naming:

- user: `javier`
- host: `odin`
- fqdn: `odin.home.arpa`

Main host target:

```bash
sudo nixos-rebuild switch --flake ~/.nix-config#odin
```

Helper commands:

```bash
rebuild
update
fmt
lint
```

`~/.nix-config/bin` is added to `PATH`, so `rebuild`, `update`, `fmt` and `lint` are available as normal shell commands.
`rebuild` runs `nix flake check` and rebuilds the host that matches the current hostname.
`update` updates flake inputs and then runs `rebuild`.
`fmt` formats the repository with Alejandra.
`lint` runs `statix` and `deadnix`.

Daily usage:

```bash
rebuild
update
home-manager switch --flake ~/.nix-config#javier-odin
fmt
lint
```

Recommended local workflow before commit:

```bash
fmt
lint
nix flake check --no-build
```

Bootstrap on a new machine:

```bash
git clone git@github.com:Poremski/nix-config.git ~/.nix-config
cd ~/.nix-config
sudo nixos-rebuild switch --flake ~/.nix-config#odin
```

If the hostname already matches a configured host, `rebuild` can be used after the first clone.

Recovery and rollback:

```bash
sudo nixos-rebuild switch --rollback
sudo nixos-rebuild boot --flake ~/.nix-config#odin
```

Use `switch --rollback` to revert the currently active generation.
Use `boot --flake` if you want the next boot to use the current flake without switching immediately.

Current structure:

- `lib/hosts.nix`: host metadata used to generate flake outputs
- `profiles/base.nix`: common profile for most machines
- `profiles/desktop.nix`: desktop-oriented profile layered on top of `base`
- `home/javier/common.nix`: shared Home Manager config for the user
- `home/javier/odin.nix`: host-specific Home Manager config
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
- `hosts/odin/default.nix`: NixOS host config for `odin`
- `hosts/odin/hardware-configuration.nix`: host-specific boot, disk and filesystem layout

Available flake targets:

```bash
sudo nixos-rebuild switch --flake ~/.nix-config#odin
home-manager switch --flake ~/.nix-config#javier-odin
```

Editor integration:

- Zed is configured declaratively through Home Manager
- Codex is exposed to Zed through `codex-acp`
- the flake includes `llm-agents` as an input for that workflow
- `nvim` is the default terminal editor via `EDITOR`, `VISUAL` and Git `core.editor`
- `lazy.nvim` writes its lockfile to Neovim's state directory to stay compatible with Home Manager's read-only config symlink

Dev tooling:

- language runtimes and toolchains are installed through `modules/cli/dev.nix`
- the current set includes Node.js/npm, Lua 5.1, LuaRocks, Python, Go, Rust, PHP, Java, GCC and GNU Make
- Neovim health support includes `pynvim` and `wl-clipboard`
- GitHub workflows are available through `gh`

CI:

- GitHub Actions runs `nix flake check`
- GitHub Actions runs `lint`
- GitHub Actions runs `fmt --check`

To add another host later:

1. Add a new entry in `lib/hosts.nix`
2. Create `home/<user>/<host>.nix`
3. Create `hosts/<host>/default.nix` for that machine's NixOS configuration

Profiles let multiple hosts share the same role without duplicating imports.
The shared NixOS base does the same for system-level Home Manager wiring.
