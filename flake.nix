{
  description = "Jappe dotfiles";

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
    # Home Manager config
    homeConfigurations.jappe = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./hosts/jappe.nix
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
