{
  description = "Javier's Home Manager and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "git+https://github.com/NixOS/nixos-hardware";

    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixos-hardware,
    ...
  }: let
    hosts = import ./lib/hosts.nix;
    defaultSystem = "x86_64-linux";
    pkgs = import nixpkgs {system = defaultSystem;};
    mkHome = host: meta: let
      hostPkgs = import nixpkgs {inherit (meta) system;};
      profileModules = builtins.map (profile: ./. + "/profiles/${profile}.nix") (meta.profiles or []);
    in
      home-manager.lib.homeManagerConfiguration {
        pkgs = hostPkgs;
        extraSpecialArgs = {
          hostMeta =
            meta
            // {
              name = host;
            };
        };

        modules =
          [
            (./. + "/home/${meta.user}/common.nix")
          ]
          ++ profileModules
          ++ [
            (./. + "/home/${meta.user}/${host}.nix")
          ];
      };
    mkNixos = host: meta:
      nixpkgs.lib.nixosSystem {
        inherit (meta) system;
        specialArgs = {
          inherit home-manager nixos-hardware;
          hostMeta =
            meta
            // {
              name = host;
            };
        };

        modules = [
          (./. + "/hosts/${host}")
        ];
      };
    homeConfigurations =
      nixpkgs.lib.mapAttrs' (host: meta: {
        name = "${meta.user}-${host}";
        value = mkHome host meta;
      })
      hosts;
    nixosConfigurations = nixpkgs.lib.mapAttrs mkNixos hosts;
  in {
    inherit homeConfigurations nixosConfigurations;

    packages.${defaultSystem}.home-manager = home-manager.packages.${defaultSystem}.home-manager;

    devShells.${defaultSystem}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.alejandra
        pkgs.deadnix
        pkgs.git
        pkgs.neovim
        pkgs.statix
      ];
    };
  };
}
