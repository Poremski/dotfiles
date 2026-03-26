#!/usr/bin/env bash

set -euo pipefail

flake_dir="${HOME}/.dotfiles"

nix flake update --flake "${flake_dir}"
"${flake_dir}/scripts/rebuild.sh"
