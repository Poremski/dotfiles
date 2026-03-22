{ home-manager, hostMeta, ... }:

{
  imports = [
    home-manager.nixosModules.home-manager
  ];

  networking.hostName = hostMeta.name;
  networking.domain = hostMeta.domain;

  users.users.${hostMeta.user} = {
    isNormalUser = true;
    home = "/home/${hostMeta.user}";
    extraGroups = [ "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${hostMeta.user} =
    import (../../. + "/home/${hostMeta.user}/${hostMeta.name}.nix");

  system.stateVersion = "23.11";
}
