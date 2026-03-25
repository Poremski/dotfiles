#!/usr/bin/env bash

set -euo pipefail

flake_dir="${HOME}/.dotfiles"
host="$(hostname -s)"

nix flake check "${flake_dir}"
sudo nixos-rebuild switch --flake "${flake_dir}#${host}"
