{
  lib,
  pkgs,
  ...
}: let
  sshConfig = pkgs.writeText "ssh-config" ''
    Host github.com
      HostName github.com
      User git

    Host *
      AddKeysToAgent no
      Compression no
      ForwardAgent no
      ServerAliveInterval 0
      ServerAliveCountMax 3
      HashKnownHosts no
      UserKnownHostsFile ~/.ssh/known_hosts
  '';
in {
  home.activation.installSshConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p "$HOME/.ssh"
    $DRY_RUN_CMD chmod 700 "$HOME/.ssh"
    $DRY_RUN_CMD rm -f "$HOME/.ssh/config"
    $DRY_RUN_CMD install -m 600 ${sshConfig} "$HOME/.ssh/config"
  '';
}
