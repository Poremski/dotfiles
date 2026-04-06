{
  hostMeta,
  pkgs,
  ...
}: let
  thinkpadKbdBacklightNotify = pkgs.writeShellScript "thinkpad-kbd-backlight-notify" ''
    set -euo pipefail

    brightness_file=/sys/class/leds/tpacpi::kbd_backlight/brightness
    max_file=/sys/class/leds/tpacpi::kbd_backlight/max_brightness

    if [[ ! -r "''${brightness_file}" || ! -r "''${max_file}" ]]; then
      exit 0
    fi

    max="$(cat "''${max_file}")"

    notify() {
      local current percent icon
      current="$(cat "''${brightness_file}")"
      percent="$(( current * 100 / max ))"

      if ! ${pkgs.qt6.qttools}/bin/qdbus org.kde.plasmashell /org/kde/osdService org.kde.osdService.keyboardBrightnessChanged "''${percent}" >/dev/null 2>&1; then
        case "''${current}" in
          0) icon="display-brightness-off" ;;
          1) icon="input-keyboard" ;;
          *) icon="display-brightness" ;;
        esac

        ${pkgs.libnotify}/bin/notify-send           --app-name=thinkpad-kbd-backlight           --expire-time=1200           --hint=int:value:"''${percent}"           --icon="''${icon}"           "Keyboard backlight"           "Level ''${current}/''${max}"
      fi
    }

    previous="$(cat "''${brightness_file}")"

    while true; do
      current="$(cat "''${brightness_file}")"

      if [[ "''${current}" != "''${previous}" ]]; then
        previous="''${current}"
        notify
      fi

      sleep 0.25
    done
  '';
in {
  home.sessionVariables = {
    DOTFILES_HOST = hostMeta.name;
    DOTFILES_FQDN = "${hostMeta.name}.${hostMeta.domain}";
  };

  xdg.configFile."plasma-localerc".text = ''
    [Formats]
    LANG=en_US.UTF-8
    LC_TIME=sv_SE.UTF-8
  '';

  systemd.user.services.thinkpad-kbd-backlight-notify = {
    Unit = {
      Description = "Notify on ThinkPad keyboard backlight changes";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${thinkpadKbdBacklightNotify}";
      Restart = "always";
      RestartSec = 1;
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
