{ home-manager, hostMeta, ... }:

let
  profileModules = builtins.map
    (profile: ../../. + "/profiles/${profile}.nix")
    (hostMeta.profiles or [ ]);
in
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
  home-manager.extraSpecialArgs = {
    inherit hostMeta;
  };
  home-manager.users.${hostMeta.user} = {
    imports = [
      (../../. + "/home/${hostMeta.user}/common.nix")
    ] ++ profileModules ++ [
      (../../. + "/home/${hostMeta.user}/${hostMeta.name}.nix")
    ];
  };

  system.stateVersion = "23.11";
}
