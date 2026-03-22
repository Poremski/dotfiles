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
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    mkHome = user: host: home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        (./. + "/home/${user}/${host}.nix")
      ];
    };
    mkNixos = host: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit home-manager;
      };

      modules = [
        (./. + "/hosts/${host}")
      ];
    };
  in
  {
    homeConfigurations.javier-poremski = mkHome "javier" "poremski";
    nixosConfigurations.poremski = mkNixos "poremski";

    packages.${system}.home-manager =
          home-manager.packages.${system}.home-manager;

    devShells.${system}.default = pkgs.mkShell {
      buildInputs = [
        pkgs.git
        pkgs.neovim
      ];
    };
  };
}
