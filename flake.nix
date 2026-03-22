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
  in
  {
    # Home Manager config for javier on the poremski host.
    homeConfigurations.javier-poremski = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home/javier/poremski.nix
      ];
    };

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
