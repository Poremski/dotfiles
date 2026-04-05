{
  home-manager,
  hostMeta,
  pkgs,
  ...
}: let
  profileModules =
    builtins.map
    (profile: ../../. + "/profiles/${profile}.nix")
    (hostMeta.profiles or []);
in {
  imports = [
    home-manager.nixosModules.home-manager
  ];

  networking.hostName = hostMeta.name;
  networking.domain = hostMeta.domain;

  users.users.${hostMeta.user} = {
    isNormalUser = true;
    home = "/home/${hostMeta.user}";
    extraGroups = ["wheel"];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    extraSpecialArgs = {
      inherit hostMeta;
    };
    users.${hostMeta.user} = {
      imports =
        [
          (../../. + "/home/${hostMeta.user}/common.nix")
        ]
        ++ profileModules
        ++ [
          (../../. + "/home/${hostMeta.user}/${hostMeta.name}.nix")
        ];
    };
  };
}
