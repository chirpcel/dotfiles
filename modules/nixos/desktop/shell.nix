{ inputs, ... }:
{
  flake.nixosModules.shell =
    { pkgs, ... }:
    {
      systemd.user.services = {
        "wpaperd" = {
          description = "wpaperd";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.wpaperd}/bin/wpaperd";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
        "ironbar" = {
          description = "Ironbar";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          enableDefaultPath = false;
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.ironbar}/bin/ironbar";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
        "swayosd-server" = {
          description = "SwayOSD server";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.swayosd}/bin/swayosd-server";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
        "anyrun" = {
          description = "Anyrun daemon";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.anyrun}/bin/anyrun daemon";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
        "stasis" = {
          description = "Stasis Wayland Idle Manager";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          enableDefaultPath = false;
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.stasis}/bin/stasis";
            ExecReload = "${pkgs.stasis}/bin/stasis reload";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
        "swaync" = {
          description = "SwayNotificationCenter";
          partOf = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          after = [ "graphical-session.target" ];
          serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.swaynotificationcenter}/bin/swaync";
            Restart = "on-failure";
            RestartSec = 2;
          };
        };
      };
      stow.packages = [
        "wpaperd"
        "ironbar"
        "anyrun"
        "stasis"
        "swaync"
      ];
      environment.systemPackages = with pkgs; [
        swayosd
        anyrun
      ];
      systemd.tmpfiles.rules = [
        "L /var/lib/anyrun/plugins/libapplications.so - - - - ${pkgs.anyrun}/lib/libapplications.so"
        "L /var/lib/anyrun/plugins/libniri_focus.so - - - - ${pkgs.anyrun}/lib/libniri_focus.so"
        "L /var/lib/anyrun/plugins/libsymbols.so - - - - ${pkgs.anyrun}/lib/libsymbols.so"
      ];
    };
}
