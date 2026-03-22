{ home-manager, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  networking.hostName = "poremski";
  networking.domain = "home.arpa";

  users.users.javier = {
    isNormalUser = true;
    home = "/home/javier";
    extraGroups = [ "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.javier = import ../../home/javier/poremski.nix;

  system.stateVersion = "23.11";
}
