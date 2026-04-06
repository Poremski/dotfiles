# Nix configuration

[![CI](https://github.com/Poremski/nix-config/actions/workflows/ci.yml/badge.svg?branch=master)](https://github.com/Poremski/nix-config/actions/workflows/ci.yml)

Personal NixOS and Home Manager flake for my machines, shell environment, editors, and developer tooling.

This is a personal NixOS configuration.
It is designed around my own machines, hardware, workflows, and preferences, and is not intended to be a generic drop-in setup.
Use at your own risk.

## Hosts

Shared user:

- `javier`

Configured hosts:

- `odin.home.arpa`: Lenovo ThinkPad X1 Carbon 7th Gen, Plasma
- `thor.home.arpa`: Dell XPS 13 9370, Hyprland

Both hosts share the same base user configuration, profiles, editors, shell setup, and most CLI/dev tooling.
Machine-specific hardware is defined in each host's `hardware-configuration.nix`, while `nixos-hardware` adds model-specific quirks for the ThinkPad and XPS.

## Common commands

```bash
rebuild
sync
update
fmt
lint
```

`~/.nix-config/bin` is added to `PATH`, so these commands are available directly.

What they do:

- `rebuild`: run `nix flake check` and rebuild the current host
- `sync`: run `git pull --ff-only` and then `rebuild`
- `update`: update flake inputs and then `rebuild`
- `fmt`: format the repo with Alejandra
- `lint`: run `statix` and `deadnix`

When you need to force a specific host during a hostname transition, `rebuild` also accepts an explicit host argument:

```bash
rebuild odin
rebuild thor
```

## Flake targets

```bash
sudo nixos-rebuild switch --flake ~/.nix-config#odin
sudo nixos-rebuild switch --flake ~/.nix-config#thor

home-manager switch --flake ~/.nix-config#javier-odin
home-manager switch --flake ~/.nix-config#javier-thor
```

## Bootstrap

Clone the repo and switch to the target host:

```bash
git clone git@github.com:Poremski/nix-config.git ~/.nix-config
cd ~/.nix-config
sudo nixos-rebuild switch --flake ~/.nix-config#odin
```

or:

```bash
sudo nixos-rebuild switch --flake ~/.nix-config#thor
```

## Recovery

```bash
sudo nixos-rebuild switch --rollback
sudo nixos-rebuild boot --flake ~/.nix-config#odin
```

Use `switch --rollback` to revert the active generation.
Use `boot --flake` if you want the next boot to use the current flake without switching immediately.

## Structure

- `flake.nix`: flake inputs and outputs
- `lib/hosts.nix`: host metadata used to generate flake outputs
- `hosts/<host>/`: host-specific NixOS configuration and hardware layout
- `home/javier/`: shared and host-specific Home Manager config
- `profiles/`: reusable bundles layered onto hosts
- `modules/nixos/`: shared NixOS modules
- `modules/cli/`: CLI and development tooling
- `modules/shell/`: shell configuration
- `modules/editors/`: editor configuration
- `modules/apps/`: GUI application bundles
- `modules/security/`: security-related modules
- `bin/`: helper commands for rebuild, sync, update, fmt, and lint

## Desktop notes

- `odin` uses Plasma via `modules/nixos/desktop/plasma.nix`
- `thor` uses Hyprland via `modules/nixos/desktop/hyprland.nix`
- `odin` imports `nixos-hardware.nixosModules.lenovo-thinkpad-x1-7th-gen`
- `thor` imports `nixos-hardware.nixosModules.dell-xps-13-9370`

## Editors and tooling

- `nvim` is the default terminal editor via `EDITOR`, `VISUAL`, and Git `core.editor`
- Neovim is configured declaratively and includes LSP support for Nix, Lua, Python, Go, Rust, PHP, Java, TypeScript, HTML, JSON, and TOML
- Zed is configured declaratively through Home Manager
- `codex-acp` is available for the Zed/Codex workflow
- language/tooling support includes Node.js, Lua 5.1, LuaRocks, Python, Go, Rust, PHP, Java, GCC, GNU Make, `jq`, `yq`, `tree`, `shellcheck`, `shfmt`, `prettier`, `ruff`, and `black`

## CI

GitHub Actions runs:

- `nix flake check`
- `lint`
- `fmt --check`

## Adding a host

1. Add the host to `lib/hosts.nix`
2. Create `hosts/<host>/default.nix`
3. Generate or add `hosts/<host>/hardware-configuration.nix`
4. Create `home/javier/<host>.nix`
5. Rebuild with the new flake target
