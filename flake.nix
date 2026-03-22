{
  description = "Javier's Home Manager and NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    hosts = import ./lib/hosts.nix;
    defaultSystem = "x86_64-linux";
    pkgs = import nixpkgs { system = defaultSystem; };
    mkHome = host: meta:
      let
        hostPkgs = import nixpkgs { system = meta.system; };
      in
      home-manager.lib.homeManagerConfiguration {
        pkgs = hostPkgs;

        modules = [
          (./. + "/home/${meta.user}/${host}.nix")
        ];
      };
    mkNixos = host: meta: nixpkgs.lib.nixosSystem {
      system = meta.system;
      specialArgs = {
        inherit home-manager;
        hostMeta = meta // { name = host; };
      };

      modules = [
        (./. + "/hosts/${host}")
      ];
    };
    homeConfigurations = nixpkgs.lib.mapAttrs'
      (host: meta: {
        name = "${meta.user}-${host}";
        value = mkHome host meta;
      })
      hosts;
    nixosConfigurations = nixpkgs.lib.mapAttrs mkNixos hosts;
  in
  {
    inherit homeConfigurations nixosConfigurations;

    packages.${defaultSystem}.home-manager =
          home-manager.packages.${defaultSystem}.home-manager;

    devShells.${defaultSystem}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.git
        pkgs.neovim
      ];
    };
  };
}
