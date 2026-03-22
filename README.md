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
