{
  hostMeta,
  lib,
  pkgs,
  ...
}: {
  users.users.${hostMeta.user}.extraGroups = lib.mkAfter ["docker"];

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    daemon.settings = {
      features = {
        buildkit = true;
      };
    };
  };

  environment.systemPackages = [
    pkgs.docker-compose
  ];
}
